import "package:flutter/material.dart";
import 'package:hexcolor/hexcolor.dart';

class AddWithDraw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topCenter,
      // width: size.width*0.86,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(0,0,0,0),
              child:FlatButton(
                  color:HexColor("#199C78"),
                  height: 45,
                  minWidth: 150,
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(4.0)),
                  onPressed: (){
                    // createOrder(context);
                  },
                  child: Text("Add",
                    style: TextStyle(color:Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500
                    ),)
              )
          ),
          Container(
              margin: EdgeInsets.fromLTRB(0,0,0,0),
              child:FlatButton(
                  color:HexColor("#199C78"),
                  height: 45,
                  minWidth: 150,
                  shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(4.0)),
                  onPressed: (){
                    // createOrder(context);
                  },
                  child: Text("Withdraw",
                    style: TextStyle(color:Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w500
                    ),)
              )
          ),
        ],
      ),
    );
  }
}
