import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:hexcolor/hexcolor.dart';

class Transactions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topLeft,
      child: Container(
        height: 310,
        width:size.width,
        // color: Colors.black,
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 50,
              // leadingWidth: 10,
              backgroundColor: Colors.white,
              elevation: 0,
              titleSpacing: 0,
              centerTitle: false,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(40),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                    indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(
                          width: 3,
                          color: HexColor("#199C78"),
                        ),
                        insets: EdgeInsets.only(
                            left: 0,
                            right: 30,
                            bottom: 4)),
                    indicatorColor: HexColor("#199C78"),
                    unselectedLabelColor: HexColor("#8C8C8C"),
                    labelColor:HexColor("#3A3A3A"),
                    labelPadding: EdgeInsets.only(left: 0, right: 0),
                    labelStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                    isScrollable: true,
                    indicatorSize: TabBarIndicatorSize.label,
                    // labelStyle: ,
                    tabs: [
                      // Container(
                      //   width:20,
                      //   child: Text("Buy"),
                      // ),
                      Tab(child:Container(
                        margin: const EdgeInsets.only(right:30.0),
                        child: Text("Bought"),
                      )),
                      // SizedBox(width:10),
                      Tab(child:Padding(
                        padding: const EdgeInsets.only(right:30.0),
                        child: Text("Sold"),
                      )),
                      Tab(child:Padding(
                        padding: const EdgeInsets.only(right:30.0),
                        child: Text("Pending"),
                      )),
                    ],
                  ),
                ),
              ),
              // title: Text('Tabs Demo'),
            ),
            body: TabBarView(
              children: [
                Container(
                  child: Column(
                    children: [
                      ListTile(

                        // tileColor: Colors.grey,
                        title: Text("Royal Dutch Shell PLC"),
                        contentPadding: EdgeInsets.fromLTRB(0, 7, 0, 7),
                        subtitle: Text("RDSA (AMS)"),
                        shape: Border(
                            bottom: BorderSide(
                                color: HexColor("#E5E5E5")
                            )
                        ),
                        leading:InkWell(

                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            // increment();
                          },

                          child: Container(
                            alignment: Alignment.center,
                            width:48,
                            height:48,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage("https://picsum.photos/250?image=9"),
                                  fit: BoxFit.fill
                              ),
                            ),
                            // child: Image.network('https://picsum.photos/250?image=9')
                          ),
                        ),
                        trailing: Container(
                          // alignment: Alignment.centerRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("x 12"),
                              Text("214 ")
                            ],
                          ),
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
                      ),
                      ListTile(
                        // tileColor: Colors.grey,
                        contentPadding: EdgeInsets.fromLTRB(0, 7, 0, 7),
                        leading:InkWell(

                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            // increment();
                          },

                          child: Container(
                            alignment: Alignment.center,
                            width:48,
                            height:48,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage("https://picsum.photos/250?image=9"),
                                  fit: BoxFit.fill
                              ),
                            ),
                            // child: Image.network('https://picsum.photos/250?image=9')
                          ),
                        ),
                        title: Text("Royal Dutch Shell PLC"),
                        subtitle: Text("RDSA (AMS)"),
                        trailing: Container(
                          // alignment: Alignment.centerRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("x 12"),
                              Text("214 ")
                            ],
                          ),
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
                      ),
                      ListTile(
                        // tileColor: Colors.grey,
                        contentPadding: EdgeInsets.fromLTRB(0, 7, 0, 7),
                        leading:InkWell(

                          borderRadius: BorderRadius.circular(50),
                          onTap: () {
                            // increment();
                          },

                          child: Container(
                            alignment: Alignment.center,
                            width:48,
                            height:48,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage("https://picsum.photos/250?image=9"),
                                  fit: BoxFit.fill
                              ),
                            ),
                            // child: Image.network('https://picsum.photos/250?image=9')
                          ),
                        ),
                        title: Text("Royal Dutch Shell PLC"),
                        subtitle: Text("RDSA (AMS)"),
                        trailing: Container(
                          // alignment: Alignment.centerRight,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("x 12"),
                              Text("214 ")
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
