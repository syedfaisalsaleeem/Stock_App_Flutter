import 'package:flutter/material.dart';
import 'package:slak/constant.dart';

class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      height: isActive ? 8 : 8,
      width: isActive ? 8 : 8,
      decoration: BoxDecoration(
        color: isActive ? slPrimaryColor : slShadowColor,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}