import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slak/Screens/Landing/Components/background.dart';
import 'package:slak/constant.dart';
import 'package:slak/components/slider_item.dart';
import 'package:slak/Screens/Landing/Components/slide_dots.dart';
import 'package:slak/screens/landing/models/SliderItemModel.dart';
import 'dart:async';
import 'package:slak/screens/login/login.dart';
import 'package:slak/screens/singup/singup.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final PageController pageController = PageController(
        initialPage: 0
    );
    // This size provide us total height and width of our screen
    return Background(

      //child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(12,12,12,25),
          decoration: BoxDecoration(color: _currentPage==0?slSliderColorZero:_currentPage==1?slSliderColorOne:slSliderColorTwo),
         child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height*0.07),
              Expanded(
              //
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: <Widget>[
                    PageView.builder(
                      scrollDirection: Axis.horizontal,
                      controller: _pageController,
                      onPageChanged: _onPageChanged,
                      itemCount: slideList.length,
                      itemBuilder: (ctx, i) => SliderItem(i),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.topStart,
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.only(bottom: 35),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              for(int i = 0; i<slideList.length; i++)
                                if( i == _currentPage )
                                  SlideDots(true)
                                else
                                  SlideDots(false)
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              //
              //)

              Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 5.0),
                          child: ButtonTheme(
                            height: size.height*0.075,
                            child: RaisedButton(
                              //color: appPrimeryColor,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Login();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: textSizeNormal,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 5.0),
                          child: ButtonTheme(
                            height: size.height*0.075,
                            buttonColor: slViewColor,
                            child: RaisedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return Singup();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: textSizeNormal
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ],

              ),
            ],
          ),
        ),
   //   ),
    );
  }
}
