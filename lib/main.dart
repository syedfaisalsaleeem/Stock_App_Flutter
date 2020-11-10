import 'package:flutter/material.dart';
import 'package:slak/components/AppWidget.dart';
import 'package:slak/constant.dart';
import 'package:slak/screens/landing/landing.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: mainAppName,
      theme: ThemeData(
      ),
      home: Landing(),
    );
  }
}

