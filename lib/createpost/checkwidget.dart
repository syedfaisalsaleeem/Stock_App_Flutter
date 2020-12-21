import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:video_player/video_player.dart';

class checkwidget extends StatefulWidget {
  @override
  _checkwidgetState createState() => _checkwidgetState();
}

class _checkwidgetState extends State<checkwidget> {
  String url_text="";
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: HexColor("#F8F9FC"),
          elevation: 2,

          leading:IconButton(

            icon:Icon(Icons.keyboard_arrow_left),
            color: HexColor("#232869"),
            iconSize: 30,
            onPressed: (){
              Navigator.pop(context,{"url_text":url_text});
              print(url_text);
              print("url_text");
              return url_text;
              // chooseImage();
              // setState(() {
              //   // instance.decreaseStep();
              // });
            },
          )
      ),
      body: Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                child:Padding(
                    padding: EdgeInsets.fromLTRB(20,20,20,0),
                    child:TextField(
                      onChanged: (val){
                        setState(() {
                          url_text = val;
                        });
                      },
                      style:TextStyle(
                        fontSize: 21,
                        // fontWeight: FontWeight.w00,
                      ),
                      keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: HexColor("#232869"), width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey, width: 1.0),
                          ),
                          hintText: 'Insert Link',
                      ),
                    )
                )
            ),
          ],
        ),
      ),
    )
    );
  }
}
