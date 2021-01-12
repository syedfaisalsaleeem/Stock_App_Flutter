import "package:flutter/material.dart";
import 'package:hexcolor/hexcolor.dart';

class MainHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // width: size.width*0.86,
      height:190,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/Rectangle.png"),
              fit:BoxFit.fill)),
      child: Container(
        alignment: Alignment.center,


        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width:(size.width*0.76),
              margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
              alignment: Alignment.topLeft,
              child:Image.asset("images/Bitmap.png"),

            ),
            Container(
                width:(size.width*0.76),
                margin: EdgeInsets.fromLTRB(0, 0, 0, 14),
             child:Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Container(
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(

                            // margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text("Bank Balance",

                              style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w500,decoration: TextDecoration.none),)
                          ),
                          Container(
                            height: 50,
                            alignment: Alignment.centerLeft,
                            child: Text("2000 USD",style: TextStyle(fontSize: 28,color: Colors.white,fontWeight: FontWeight.bold, decoration: TextDecoration.none
                                )),
                          )

                        ],
                      )
                  ),
                  FlatButton(
                      minWidth: 80,
                      onPressed: (){},
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.only(

                            topLeft: const Radius.circular(15),
                            topRight: const Radius.circular(15),
                            bottomLeft: const Radius.circular(15),
                            bottomRight: const Radius.circular(15),
                          ),
                          side: BorderSide(
                              color: HexColor("#FFFFFF"),
                              width: 1.5,
                          ),
                      ),
                      child: Text("View Details",style: TextStyle(color: Colors.white,fontSize: 12),)
                  )
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
