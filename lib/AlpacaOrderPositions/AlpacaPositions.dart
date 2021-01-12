import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:slak/AlpacaOrderPositions/components/AddWithDraw.dart';
import 'package:slak/AlpacaOrderPositions/components/mainheader.dart';
import 'package:slak/AlpacaOrderPositions/components/transactions.dart';
import 'package:slak/ViewAllTransactions/ViewAllTransactionsmain.dart';

class AlpacaPosition extends StatefulWidget {
  @override
  _AlpacaPositionState createState() => _AlpacaPositionState();
}
class CustomAppBar extends PreferredSize {
  final Widget child;
  final double height;

  CustomAppBar({@required this.child, this.height = kToolbarHeight});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Colors.orange,
      alignment: Alignment.center,
      child: child,
    );
  }
}
class _AlpacaPositionState extends State<AlpacaPosition> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:Brightness.dark,// status bar color
    ));
    return Scaffold(
      appBar: CustomAppBar(
        height: 90,
          child: Container(
            color: Colors.white,
            child:Column(
              children: [
              Container(
              width: size.width,
              height:90,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/Tracciato_869.png"),

                      fit:BoxFit.fill)),
              child: Container(
                // width: size.width*0.1,
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FlatButton.icon(
                      icon: Icon(Icons.arrow_back_ios),//icon image
                      label: Text('Account',style: TextStyle(fontSize: 23,color: HexColor("#3A3A3A")),),//text to show in button
                      textColor: Colors.black,//button text and icon color.
                      color: Colors.transparent,//button background color
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
      ]))),
      body:
                Center(
                  child: SingleChildScrollView(
                    // scrollDirection: Axis.vertical,
                    child: Container(
                      // color: Colors.black,
                      width: size.width*0.87,
                      // color: Colors.red,
                      // padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: Column(
                        children: [
                          SizedBox(height:size.height*0.03),
                          MainHeader(),
                          SizedBox(height:16),
                          AddWithDraw(),
                          SizedBox(height:40),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text("Transactions",
                                style: TextStyle(fontSize: 18,color: HexColor("#3A3A3A"),fontWeight: FontWeight.bold, decoration: TextDecoration.none
                            )),
                          ),
                          Transactions(),
                          Container(
                            alignment: Alignment.center,
                            child: FlatButton(
                              child: Text("View All",
                              style: TextStyle(
                                color: HexColor("#199C78"),
                                fontSize: 14,
                                fontWeight: FontWeight.bold
                              ),
                              ),
                              onPressed: (){
                                Navigator.push(context,MaterialPageRoute(builder: (context) => ViewAllTransactionsMain()));
                              },
                            ),
                          ),
                          SizedBox(height:42),
                          Container(
                            alignment: Alignment.topLeft,
                            child: Text("Profile",
                                style: TextStyle(fontSize: 20,color: HexColor("#3A3A3A"),fontWeight: FontWeight.bold, decoration: TextDecoration.none
                                )),
                          ),
                          ListTile(
                            // tileColor: Colors.grey,

                            leading:InkWell(

                              borderRadius: BorderRadius.circular(50),
                              onTap: () {
                                // increment();
                              },

                              child: Container(
                                margin: EdgeInsets.only(top:5),
                                alignment: Alignment.center,
                                width:20,
                                height:20,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage("images/Shape.png"),
                                      fit: BoxFit.fill
                                  ),
                                ),
                                // child: Image.network('https://picsum.photos/250?image=9')
                              ),
                            ),
                            title: Text("Personal Details",
                            style: TextStyle(color: HexColor("#3A3A3A"),fontSize: 16,fontWeight: FontWeight.w600),
                            ),
                            trailing: Icon(Icons.chevron_right,color: Colors.black,size: 25,)
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border:Border(
                                    bottom: BorderSide(
                                        color: HexColor("#E5E5E5")
                                    )
                                )
                            ),
                          ),
                          ListTile(
                            // tileColor: Colors.grey,
                                leading:Padding(
                                padding: const EdgeInsets.only(top:3.0),
                                child: Icon(Icons.insert_drive_file_rounded,color:HexColor("#896FBB"),size:20),
                              ),
                              title: Text("Documents",
                                style: TextStyle(color: HexColor("#3A3A3A"),fontSize: 16,fontWeight: FontWeight.w600),
                              ),
                              trailing: Icon(Icons.chevron_right,color: Colors.black,size: 25,)
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border:Border(
                                    bottom: BorderSide(
                                        color: HexColor("#E5E5E5")
                                    )
                                )
                            ),
                          ),
                          // MainHeader(),
                          // MainHeader(),
                        ],
                      ),
                    ),
                  ),
                ));







  }
}
