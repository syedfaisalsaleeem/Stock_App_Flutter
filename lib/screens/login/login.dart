import 'package:flutter/material.dart';
import 'package:slak/constant.dart';
import 'package:slak/components/customBar.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:slak/components/drop_down.dart';
import 'package:flutter_svg/svg.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _controller = new TextEditingController();
  var items = ['Male', 'Female'];
  bool passwordVisible = false;
  bool passwordVisibleConfirm = false;
  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    passwordVisibleConfirm = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customBar(context),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              children: <Widget>[
                Text(
                  'Login To Your Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: textSizeXXXLarge),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: fieldBetweenPanding),
                  child: TextField(
                    decoration: InputDecoration(
                      // focusedBorder: UnderlineInputBorder(
                      //   borderSide: BorderSide(color: slShadowColor),
                      // ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: slShadowColor),
                      ),
                      labelText: 'Username/Email',
                      //labelStyle: (size: textSizeSMedium),
                      labelStyle: TextStyle(fontSize: textSizeSMedium),
                      filled: true,
                    ),
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.done,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: fieldBetweenPanding),
                  child: TextField(
                    //style: primaryTextStyle(),
                    obscureText: passwordVisible,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(fontSize: textSizeSMedium),
                        // focusedBorder: UnderlineInputBorder(
                        //   borderSide: BorderSide(color: appStore.textPrimaryColor),
                        // ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: slShadowColor),
                        ),
                        filled: true,
                        suffixIcon: IconButton(
                          icon: Icon(
                              passwordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: slIconColor),
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                        )),
                    cursorColor: Colors.black,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: fieldBetweenPanding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Text(
                      //   ''
                      // ),
                      SizedBox(width: 4),
                      GestureDetector(
                          child: Text(
                            'Forgot your password?',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: textSizeSmall),
                          ),
                          onTap: () {})
                    ],
                  ),
                ),
                Container(
                  //padding: const EdgeInsets.only(bottom: fieldBetweenPanding),
                  child: Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(left: 5.0),
                      child: ButtonTheme(
                        height: MediaQuery.of(context).size.height * 0.045,
                        buttonColor: slTextPrimaryColor,
                        child: RaisedButton(
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) {
                            //       return Singup();
                            //     },
                            //   ),
                            // );
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white, fontSize: textSizeNormal),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(bottom: fieldBetweenPanding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Not a member yet?'),
                      SizedBox(width: 4),
                      GestureDetector(
                          child: Text(
                            'Sing up',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: textSizeSmall),
                          ),
                          onTap: () {})
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //text(t6_lbl_already_did_this),
                      Text('Or Sign up with'),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(fieldBetweenPanding),
                  padding: const EdgeInsets.only(bottom: fieldBetweenPanding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: slTextPrimaryColor),
                        width: MediaQuery.of(context).size.width / 7.5,
                        height: MediaQuery.of(context).size.width / 7.5,
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width / 28),
                        child: SvgPicture.asset(google_fill,
                            color: Colors.white, width: 20, height: 20),
                      ),
                      SizedBox(width: 20),
                      Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: slTextPrimaryColor),
                        width: MediaQuery.of(context).size.width / 7.5,
                        height: MediaQuery.of(context).size.width / 7.5,
                        padding: EdgeInsets.all(
                            MediaQuery.of(context).size.width / 28),
                        child: SvgPicture.asset(facebook_fill,
                            color: Colors.white),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
