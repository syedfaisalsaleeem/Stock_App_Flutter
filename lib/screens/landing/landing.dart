import 'package:flutter/material.dart';
import 'package:slak/Screens/Landing/Components/body.dart';

class Landing extends StatefulWidget {

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Container(
            child: Body(),
          )
      ),
    );
  }
}
