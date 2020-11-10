import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slak/constant.dart';

Widget customBar(BuildContext context, {String title='', Color textColor=Colors.black, Color iconColor=Colors.black, Color appBarColor=Colors.transparent,bool bottomLine = false}) {
  return AppBar(
    elevation: 0,
    automaticallyImplyLeading: false,
    centerTitle: true,
    backgroundColor: appBarColor ?? Colors.transparent,
    bottom:PreferredSize(
        child: Container(
          color: slShadowColor,
          height: bottomLine?1.0:0.0,
        ),
    ),
    title: Container(
      margin: EdgeInsets.fromLTRB(0,10,0,0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Row(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,0,0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: textSizeMedium,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  'Back',
                  style: TextStyle(
                      fontSize: textSizeMedium,
                      color: Colors.black
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Text(
            title,
            style: TextStyle(
                fontSize: textSizeMedium,
                color: Colors.black
            ),
          ),
          Spacer()
        ],
      ),
    ),
  );
}