import 'dart:convert';
import 'dart:io' ;

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:slak/Learning/Action_Video.dart';
import 'package:slak/createpost/camera.dart';
import 'package:slak/createpost/checkwidget.dart';
import 'package:slak/createpost/feedCreated.dart';
// import 'package:slak/Screens/Landing/Components/body.dart';
class CreatePost extends StatefulWidget {
  List<CameraDescription> cameras = [];


  //CameraExampleHome({this.cameras}, {Key key}) : super(key: key);
  CreatePost({this.cameras});
  @override
  _CreatePostState createState() => _CreatePostState(cameras);
}

class _CreatePostState extends State<CreatePost> {
  static final String uploadEndPoint =
      'http://localhost/flutter_test/upload_image.php';
  Future<File> file;
  String status = '';
  String base64Image;
  File tmpFile;
  String errMessage = 'Error Uploading Image';
  int maxLines = 11;
  List cameras;
  String fileimage;
  Future<File> files1;
  File tmpFile1;
  String profileImage="https://picsum.photos/250?image=9";
  String username;
  String url="";
  String postImage;
  String summary=" ";
  bool checkbutton=true;
  String url_return;
  _CreatePostState(this.cameras);
  void get_profile_data() async{
    Response response=await get('https://9q2d566izk.execute-api.us-east-1.amazonaws.com/dev/userprofile?userid=1234userid');
    Map data=jsonDecode(response.body);
    setState((){
      username=data["body"][0]["username"];
      profileImage=data["body"][0]["image"];
    });

    print(data);
  }
  @override
  void initState() {
     print(cameras);
     print("this camera 123455");
     get_profile_data();
   }
   void upload_post() async{
     Response response=await post('https://9q2d566izk.execute-api.us-east-1.amazonaws.com/dev/createpost',
         body: {
           "user_id":"1234userid",
           "summary":summary,
           "url":url,
           "image": postImage
     }

     );
     print(jsonDecode(response.body));
     Map data=jsonDecode(response.body);
     print(data['body']);
     Navigator.push(context,MaterialPageRoute(builder: (context) => feedCreated()));
     setState(() {
       // checkbutton=true;
     });

   }
  chooseImage() {
    setState(() {
      file =  ImagePicker.pickImage(source: ImageSource.gallery);

      tmpFile = null;
      fileimage=null;
      checkbutton = true;
    });
    // if(tmpFile!=null){
    //   setState(() {
    //     checkbutton = false;
    //   });
    // }
    print(file);
    print(tmpFile);
    print("this is fiel");
    setStatus('');
  }
  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  void camerapagedata()  async{
  final information= await Navigator.push(context,MaterialPageRoute(builder: (context) => CameraExampleHome(cameras: cameras)));
  // files1=information['files'];
  if(information!=null) {
    fileimage = information['files'];
    // file=information;
    print(information['files']);
    // file=String information;
    setStatus('');
    print("this is information");
    final bytes = File(fileimage).readAsBytesSync();
    String img64 = base64Encode(bytes);
    setState(() {
      file = null;
    });
    print(bytes);
    print(img64);

    setState(() {
      postImage = img64;
      checkbutton = false;
    });
  }
  }
  Widget _thumbnailWidget() {

    // if(fileimage!=null) {
    //   // stringToBase64.encode(files1);
    //   final bytes = File(fileimage).readAsBytesSync();
    //   print(bytes);
    //   print("this is printed");
    // }
    return Container(

          child:
            fileimage == null
                ? Container()
                : SizedBox(
              child:  Image.file(File(fileimage),fit: BoxFit.fill),

              // width: 164.0,
              // height:164.0,
            ),

    );
  }
  Widget showImage() {
    return FutureBuilder<File>(
      future: file,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            null != snapshot.data) {

          tmpFile = snapshot.data;
          print(tmpFile);
          print("tmpFile0");
          base64Image = base64Encode(snapshot.data.readAsBytesSync());
          // printWrapped(base64Image);
          print("This is printed");
          print(base64Image);
          postImage=base64Image;
          WidgetsBinding.instance.addPostFrameCallback((_){
            if(tmpFile!=null){
              setState(() {
                postImage = base64Image;
                checkbutton = false;
              });

            }
            else{
              setState(() {
                checkbutton = true;
              });

            }
            // Add Your Code here.

          });



          print("This is printed");
          // if(base64Image.length!=0){
          //   setState(() {
          //     maxLines=null;
          //   });
          // }
          return Container(

            child: Image.file(
              snapshot.data,
              fit: BoxFit.fill,
            ),
          );
        } else if (null != snapshot.error) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            '',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }
  void get_urL() async {
    final temp_url_return= await Navigator.push(context,MaterialPageRoute(builder: (context) => checkwidget()));
    print(temp_url_return["url_text"]);
    print("Here is the url returned");
    setState(() {
      url_return = temp_url_return["url_text"];
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              toolbarHeight: 70,
              titleSpacing: 0.0,

              backgroundColor: HexColor("#F8F9FC"),
              title:
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(0,0,30,0),
                    child:FlatButton(
                      child: Text("Post",
                        style:TextStyle(
                          color: checkbutton==true?Colors.grey:HexColor("#232869"),
                          fontSize: 18,
                      ),
                    ),
                  onPressed: checkbutton==true ? null : () {
                        print("post");
                        upload_post();
                  },
                  )
                  )

                ],
              ),
              elevation: 2,

              leading:IconButton(

                icon:Icon(Icons.keyboard_arrow_left),
                color: HexColor("#232869"),
                iconSize: 30,
                onPressed: (){
                  // chooseImage();
                  // setState(() {
                  //   // instance.decreaseStep();
                  // });
                },
              ),
            ),
          body:
          Container(
            child:SingleChildScrollView(
            child: Column(
              children:[
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SizedBox(
                      width:20
                    ),
                    InkWell(

                      borderRadius: BorderRadius.circular(50),
                      onTap: () {
                        // increment();
                      },

                      child: Container(
                        alignment: Alignment.center,
                        width:75,
                        height:75,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: NetworkImage(profileImage),
                                fit: BoxFit.fill
                            ),
                          ),
                        // child: Image.network('https://picsum.photos/250?image=9')
                      ),
                    ),
                    SizedBox(
                      width:20
                    ),

                    Container(
                      height: 45,
                      // width: 85,
                      // color: Colors.black,
                      decoration: BoxDecoration(
                        color:Colors.white,
                        shape: BoxShape.rectangle
                      ),
                      child: Text(username == null? 'Loading ..':username,
                        style:TextStyle(
                        fontSize: 17,
                          fontWeight: FontWeight.bold,
                        )
                      ),
                    ),

                  ],
                ),

                      Container(
                        child:Padding(
                        padding: EdgeInsets.fromLTRB(20,20,20,0),
                        child:TextField(
                          maxLines:maxLines,
                          onChanged: (val){
                            // setState(() {
                            //   summary=val;
                            // });
                            //
                          },

                          // maxLines: null,
                          // expands: true,
                          style:TextStyle(
                            fontSize: 21,
                            // fontWeight: FontWeight.w00,
                          ),
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                              hintText: 'What do you want to talk about ?',

                          ),
                        )
                        )
                        ),
                Container(
                  child: showImage(),
                ),
                Container(
                  child: _thumbnailWidget(),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    border:Border(
                      top: BorderSide(
                        color: HexColor("#E5E5E5")
                      ),
                      bottom: BorderSide(
                        color: HexColor("#E5E5E5")
                    )
                    )
                  ),
                  child:ListTile(
                    // leading: ,

                    leading:Icon(Icons.link,
                        color: HexColor("#232869"),size:(26)) ,
                    title: Text(url_return==null?"Insert Link":url_return),
                    onTap: () {
                      get_urL();


                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border:Border(
                          bottom: BorderSide(
                              color: HexColor("#E5E5E5")
                          )
                      )
                  ),
                  child:ListTile(
                    // leading: ,

                    leading:Icon(Icons.photo_library,
                        color: HexColor("#232869"),size:(26)) ,
                    title: Text("Photo from Gallery"),
                    onTap: (() {
                      print("worked");
                      chooseImage();
                    }),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border:Border(
                          bottom: BorderSide(
                              color: HexColor("#E5E5E5")
                          )
                      )
                  ),
                  child:ListTile(
                    // leading: ,

                    leading:Icon(Icons.camera_alt,
                        color: HexColor("#232869"),size:(26)) ,
                    title: Text("Access Camera"),
                    onTap: (() {

                      camerapagedata();
                      // print(x);
                      // print("this is file.path returned");

                    }),
                  ),
                ),

              SizedBox(
                height: 1,
              )

              ]

            ),
          )
      )
        )
    );
  }
}


