import 'package:flutter/material.dart';
import 'package:slak/screens/landing/models/SliderItemModel.dart';
import 'package:slak/constant.dart';

class SliderItem extends StatelessWidget {
  int index;
  SliderItem(this.index);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(height: size.height*0.02),
        Text(
          slideList[index].title,
          style: TextStyle(
            fontSize: textSizeXXLarge,
            letterSpacing: 0.35,
            fontWeight: FontWeight.w500,
            fontFamily: 'Montserrat',
            color: slTextPrimaryColor,
          ),
        ),
        Text(
          slideList[index].description,
          style: TextStyle(
            fontSize: textSizeLarge,
            letterSpacing: -0.36,
            fontFamily: 'Rubik',
            color: slTextPrimaryColor,
          ),
        ),
        SizedBox(height: size.height*0.09),
      ],
    );
  }
}
