import 'dart:async';
import 'dart:io';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';



class AlpacaMain extends StatefulWidget {
  @override
  _AlpacaMainState createState() => _AlpacaMainState();
}

class _AlpacaMainState extends State<AlpacaMain> {
  String dropdownValue = 'One';
  List<bool> _selections = List.generate(2, (_) => false);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
          appBar:AppBar() ,
            body:
              Container(
                color: Colors.white,
                  child:SingleChildScrollView(
                      child:Column(
                        children:[
                          Container(
                            margin: EdgeInsets.all(18),
                            // color: Colors.blueGrey,
                            child:
                              Column(
                                children: [
                                  Container(
                                    height: 165,
                                    decoration: new BoxDecoration(
                                        color: HexColor("#121214"),
                                        borderRadius: new BorderRadius.only(
                                          topLeft: const Radius.circular(8.0),
                                          topRight: const Radius.circular(8.0),
                                          bottomLeft: const Radius.circular(8.0),
                                          bottomRight: const Radius.circular(8.0),
                                        )
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height:82.5,
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                margin:EdgeInsets.fromLTRB(9,0,0,0),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin:EdgeInsets.fromLTRB(0,11,0,0),
                                                      child:Text("Tesla Inc",
                                                        style:TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18
                                                        ) ,
                                                      )
                                                    ),
                                                    Container(
                                                      margin:EdgeInsets.fromLTRB(0,4,0,0),
                                                      child:Text("TSLA:xnas USD",
                                                        style:TextStyle(
                                                            color: Colors.white54,
                                                            fontSize: 14
                                                        ),
                                                      )
                                                    )
                                                  ],
                                                ),

                                              ),
                                              Container(
                                                margin:EdgeInsets.fromLTRB(0,15,10,0),
                                                child:Image.asset("images/Past Day.png"),

                                              )
                                            ],
                                          ),
                                        ),
                                        Container(
                                          height:82.5,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                  margin:EdgeInsets.fromLTRB(0,11,0,0),
                                                  alignment:Alignment.centerLeft,
                                                  child:Text(" \u0024 12,900",
                                                          style:TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 31,
                                                              fontWeight:FontWeight.w400,

                                                          ) ,
                                                        )
                                                    ),
                                              Container(
                                                margin:EdgeInsets.fromLTRB(0,0,10,20),
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                        margin:EdgeInsets.fromLTRB(0,4,0,0),
                                                        child:Text("+\u002492.86 USD",
                                                          style:TextStyle(
                                                              color: Colors.white54,
                                                              fontSize: 14
                                                          ),
                                                        )
                                                    ),
                                                    Container(
                                                        // margin:EdgeInsets.fromLTRB(0,4,0,0),
                                                        child:Text("(6.66%)",
                                                          style:TextStyle(
                                                              color: Colors.white54,
                                                              fontSize: 14
                                                          ),
                                                        )
                                                    )
                                                  ],
                                                ),

                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),//This is for buy sell toggle buttons
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                    height: 46,
                                    // color: Colors.brown,
                                    child:Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              FlatButton(
                                                  height:40,
                                                  minWidth: 73,
                                                  onPressed: (){

                                                  },
                                                  color:HexColor("#121214"),

                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: new BorderRadius.only(
                                                        topLeft: const Radius.circular(8.0),
                                                        topRight: const Radius.circular(0),
                                                        bottomLeft: const Radius.circular(8.0),
                                                        bottomRight: const Radius.circular(0),
                                                      ),
                                                      side: BorderSide(color: HexColor("#121214"))
                                                  ),
                                                  child: Text("BUY",
                                                    style: TextStyle(
                                                        color: Colors.white
                                                    ),
                                                  )),
                                              FlatButton(
                                                  height:40,
                                                  minWidth: 73,
                                                  onPressed: (){

                                                  },
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: new BorderRadius.only(
                                                        topLeft: const Radius.circular(0),
                                                        topRight: const Radius.circular(8.0),
                                                        bottomLeft: const Radius.circular(0),
                                                        bottomRight: const Radius.circular(8.0),
                                                      ),
                                                      side: BorderSide(color: HexColor("#EFEFEF"))
                                                  ),
                                                  child: Text("SELL",
                                                    style: TextStyle(
                                                        color: HexColor("#A7B2C5")
                                                    ),
                                                  )),
                                            ],
                                          ),

                                        ),
                                        Container(
                                          child:Row(
                                            children: [
                                              FlatButton(
                                                  height:40,
                                                  minWidth: 73,
                                                  onPressed: (){

                                                  },
                                                  color:HexColor("#121214"),

                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: new BorderRadius.only(
                                                        topLeft: const Radius.circular(8.0),
                                                        topRight: const Radius.circular(0),
                                                        bottomLeft: const Radius.circular(8.0),
                                                        bottomRight: const Radius.circular(0),
                                                      ),
                                                      side: BorderSide(color: HexColor("#121214"))
                                                  ),
                                                  child: Text("CALL",
                                                    style: TextStyle(
                                                        color: Colors.white
                                                    ),
                                                  )),
                                              FlatButton(
                                                  height:40,
                                                  minWidth: 73,
                                                  onPressed: (){

                                                  },
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius: new BorderRadius.only(
                                                        topLeft: const Radius.circular(0),
                                                        topRight: const Radius.circular(8.0),
                                                        bottomLeft: const Radius.circular(0),
                                                        bottomRight: const Radius.circular(8.0),
                                                      ),
                                                      side: BorderSide(color: HexColor("#EFEFEF"))
                                                  ),
                                                  child: Text("PUT",
                                                    style: TextStyle(
                                                        color: HexColor("#A7B2C5")
                                                    ),
                                                  )),
                                            ],
                                          )

                                        ),

                                      ],
                                    )
                                  ),
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                    height: 45,
                                    color: Colors.blue,
                                    child: Row(
                                      children: [
                                        Text("MARGIN CALL"

                                        ),
                                        Container(

                                        )
                                      ],
                                    )
                                  ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.all(8),
                                    child:
                                      Container(
                                          height:70,
                                          color:Colors.green,
                                          child:Row(
                                              children:[
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 10,0),
                                                  // height: 70,
                                                  width: 90,

                                                  color:Colors.red,
                                                  child: Center(child: Text('Item')),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 10,0),
                                                  // height: 50,
                                                  width: 90,
                                                  color:Colors.yellow,
                                                  child: Center(child: Text('Item')),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 10,0),
                                                  // height: 50,
                                                  width: 90,
                                                  color:Colors.pink,
                                                  child: Center(child: Text('Item')),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(0, 0, 10,0),
                                                  // height: 50,
                                                  width: 90,
                                                  color:Colors.orange,
                                                  child: Center(child: Text('Item')),
                                                )
                                              ]
                                          )
                                      ),
                                  ),

                                ],
                              ),
                          ),
                          Container(
                            height: 45,

                            color: Colors.grey,
                            child: Center(child: Text('Item')),
                          ),
                          Container(
                            margin: EdgeInsets.all(18),
                            height:420,

                            color: Colors.greenAccent,
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(0,31,0,0),
                                  alignment:Alignment.topLeft ,
                                  child: Text("Type"),

                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0,9.36,0,0),
                                  width:size.width*1,
                                  color: Colors.red,
                                  alignment:Alignment.topLeft ,
                                    child:Container(
                                        width:size.width*0.9,
                                        decoration: ShapeDecoration(
                                          shape: RoundedRectangleBorder(
                                            side: BorderSide(width: 1.0, style: BorderStyle.solid),
                                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                          ),
                                        ),
                                        child:DropdownButton<String>(
                                          value: dropdownValue,


                                          isExpanded: true,
                                          icon: Icon(Icons.arrow_downward),
                                          iconSize: 24,
                                          elevation: 16,

                                          style: TextStyle(color: Colors.deepPurple),
                                          underline: Container(
                                            height: 0
                                          ),
                                          //   width:size.width,
                                          //   // color: Colors.deepPurpleAccent,
                                          //   decoration: ShapeDecoration(
                                          //     shape: RoundedRectangleBorder(
                                          //       side: BorderSide(width: 1.0, style: BorderStyle.solid),
                                          //       borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                          //     ),
                                          //   ),
                                          // ),
                                          onChanged: (String newValue) {
                                            setState(() {
                                              dropdownValue = newValue;
                                            });
                                          },
                                          items: <String>['One', 'Two', 'Free', 'Four']
                                              .map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                    ),

                                ),
                                Container(
                                    width: size.width,
                                    height: 52,
                                    color: Colors.black26,
                                  margin: EdgeInsets.fromLTRB(0,35.63,0,0),
                                  child:Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [

                                      Container(
                                          height: 52,
                                        width: size.width*0.45,


                                          // color: Colors.black,
                                        child:Column(
                                          children: [
                                            Container(
                                              height: 22,
                                              child: Text("SHARES"),
                                              alignment:Alignment.topLeft,
                                            ),
                                            Container(
                                                height: 30,
                                                alignment: Alignment.bottomLeft,
                                                color: Colors.black26,
                                              child:Row(
                                                children: [
                                                  Container(
                                                    width:25.6,
                                                    child:
                                                    FlatButton(
                                                      padding: EdgeInsets.fromLTRB(0, 0, 0,0),
                                                      color: Colors.deepPurple,
                                                      // minWidth: 10,
                                                      height: 25.6,
                                                      onPressed: (){
                                                      },
                                                      child: Text("+"),

                                                    )

                                                  ),
                                                  Container(
                                                    margin:EdgeInsets.fromLTRB(15, 0, 15, 0),
                                                    child:Text("753")
                                                  ),
                                                  Container(
                                                      width:25.6,
                                                      child:
                                                      FlatButton(
                                                        padding: EdgeInsets.fromLTRB(0, 0, 0,0),
                                                        color: Colors.deepPurple,
                                                        // minWidth: 10,
                                                        height: 25.6,
                                                        onPressed: (){
                                                        },
                                                        child: Text("-"),

                                                      )
                                                  )
                                                ],
                                              )
                                            )
                                          ],
                                        )
                                      ),
                                      Container(
                                        width: size.width*0.28,

                                        color: Colors.red,
                                          child:Column(

                                            children: [
                                              Container(
                                                height: 22,
                                                child: Text("PRICE"),
                                                alignment:Alignment.topLeft,
                                              ),
                                              Container(
                                                  height: 30,
                                                  alignment: Alignment.bottomLeft,
                                                  color: Colors.black26,
                                                  child:Row(
                                                    children: [
                                                      Container(
                                                          width:25.6,
                                                          child:
                                                          FlatButton(
                                                            padding: EdgeInsets.fromLTRB(0, 0, 0,0),
                                                            color: Colors.deepPurple,
                                                            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(4.0)),
                                                            // minWidth: 10,
                                                            height: 25.6,
                                                            onPressed: (){
                                                            },
                                                            child: Text("+"),

                                                          )

                                                      ),
                                                      Container(
                                                          margin:EdgeInsets.fromLTRB(15, 0, 15, 0),
                                                          child:Text("753")
                                                      ),
                                                      Container(
                                                          width:25.6,
                                                          child:
                                                          FlatButton(
                                                            padding: EdgeInsets.fromLTRB(0, 0, 0,0),
                                                            color: Colors.deepPurple,
                                                            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(4.0)),
                                                            // minWidth: 10,
                                                            height: 25.6,
                                                            onPressed: (){
                                                            },
                                                            child: Text("-"),

                                                          )
                                                      )
                                                    ],
                                                  )
                                              )
                                            ],
                                          )
                                      )
                                    ],
                                  )
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0,31,0,0),
                                  alignment:Alignment.topLeft ,
                                  child: Text("DURATION"),

                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0,9.36,0,0),
                                  width:size.width*1,
                                  color: Colors.red,
                                  alignment:Alignment.topLeft ,
                                  child:Container(
                                    width:size.width*0.9,
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        side: BorderSide(width: 1.0, style: BorderStyle.solid),
                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                      ),
                                    ),
                                    child:DropdownButton<String>(
                                      value: dropdownValue,


                                      isExpanded: true,
                                      icon: Icon(Icons.arrow_downward),
                                      iconSize: 24,
                                      elevation: 16,

                                      style: TextStyle(color: Colors.deepPurple),
                                      underline: Container(
                                          height: 0
                                      ),
                                      //   width:size.width,
                                      //   // color: Colors.deepPurpleAccent,
                                      //   decoration: ShapeDecoration(
                                      //     shape: RoundedRectangleBorder(
                                      //       side: BorderSide(width: 1.0, style: BorderStyle.solid),
                                      //       borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                      //     ),
                                      //   ),
                                      // ),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownValue = newValue;
                                        });
                                      },
                                      items: <String>['One', 'Two', 'Free', 'Four']
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ),

                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(0,39.63,0,0),
                                  child:FlatButton(
                                    color:Colors.black,
                                    height: 40,
                                    minWidth: 160,
                                      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(4.0)),
                                    onPressed: (){

                                    },
                                    child: Text("Place Order")
                                  )
                                ),
                              ],
                            ),
                          ),


                        ])
                  ),
              )

    );
  }
}
