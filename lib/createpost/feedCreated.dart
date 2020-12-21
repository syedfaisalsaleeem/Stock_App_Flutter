import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:video_player/video_player.dart';

class feedCreated extends StatefulWidget {
  @override
  _feedCreatedState createState() => _feedCreatedState();
}

class _feedCreatedState extends State<feedCreated> {

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
              Navigator.pop(context);

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
                    child:Text("Feed is Created")

                )
            ),
          ],
        ),
      ),
    )
    );
  }
}
