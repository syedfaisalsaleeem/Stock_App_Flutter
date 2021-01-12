import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:slak/AlpacaOrderPositions/AlpacaPositions.dart';
class ViewAllTransactionsMain extends StatefulWidget {
  @override
  _ViewAllTransactionsMainState createState() => _ViewAllTransactionsMainState();
}
class CustomAppBar extends PreferredSize {
  final Widget child;
  final double height;

  CustomAppBar({@required this.child, this.height = kToolbarHeight});

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: preferredSize.height,
      color: Colors.orange,
      alignment: Alignment.center,
      child: child,
    );
  }
}
class _ViewAllTransactionsMainState extends State<ViewAllTransactionsMain> {
  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:Brightness.dark,// status bar color
    ));
    return Scaffold(
      appBar: CustomAppBar(
        height: 90,
          child: Container(
            color: Colors.white,
            child:Column(
              children: [
              Container(
              width: size.width,
              height:90,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/Tracciato_869.png"),

                      fit:BoxFit.fill)),
              child: Container(
                // width: size.width*0.1,
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FlatButton.icon(
                      icon: Icon(Icons.arrow_back_ios),//icon image
                      label: Text('Transactions',style: TextStyle(fontSize: 23,color: HexColor("#3A3A3A")),),//text to show in button
                      textColor: Colors.black,//button text and icon color.
                      color: Colors.transparent,//button background color
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => AlpacaPosition()));
                      },
                    ),
                  ],
                ),
              ),
            ),
      ]))),
      body: Center(
        child:Container(

      )));
  }
}