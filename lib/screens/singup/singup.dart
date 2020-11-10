import 'package:flutter/material.dart';
import 'package:slak/constant.dart';
import 'package:slak/components/customBar.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:slak/components/drop_down.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slak/screens/singup/email_verfication.dart';

class Singup extends StatefulWidget {
  @override
  _SingupState createState() => _SingupState();
}

class _SingupState extends State<Singup> {
  final TextEditingController _controller = new TextEditingController();
  var items = ['Male','Female'];
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
                  'Create New Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: textSizeXXXLarge
                  ),
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
                      labelText: 'Username',
                      //labelStyle: (size: textSizeSMedium),
                      labelStyle: TextStyle(
                          fontSize: textSizeSMedium
                      ),
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
                    decoration: InputDecoration(
                      // focusedBorder: UnderlineInputBorder(
                      //   borderSide: BorderSide(color: slShadowColor),
                      // ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: slShadowColor),
                      ),
                      labelText: 'Your full Name',
                      //labelStyle: (size: textSizeSMedium),
                      labelStyle: TextStyle(
                          fontSize: textSizeSMedium
                      ),
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
                    decoration: InputDecoration(
                      // focusedBorder: UnderlineInputBorder(
                      //   borderSide: BorderSide(color: slShadowColor),
                      // ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: slShadowColor),
                      ),
                      labelText: 'Date of Birth',
                      //labelStyle: (size: textSizeSMedium),
                      labelStyle: TextStyle(
                          fontSize: textSizeSMedium
                      ),
                      filled: true,
                    ),
                    showCursor: false,
                    readOnly: false,
                    onTap: ()
                    async {
                      var datePicked = await DatePicker.showSimpleDatePicker(
                        context,
                        initialDate: DateTime(1994),
                        firstDate: DateTime(1960),
                        lastDate: DateTime(2012),
                        dateFormat: "dd-MMMM-yyyy",
                        locale: DateTimePickerLocale.en_us,
                        looping: false,
                      );
                      final DateFormat formatter = DateFormat('yyyy-MM-dd');
                      final String formatted = formatter.format(datePicked);
                    },
                  ),
                ),

                Container(
                  padding: const EdgeInsets.only(bottom: fieldBetweenPanding),
                  //padding: EdgeInsets.all(8),
                  child: DropDownFormField(
                    titleText: '',
                    hintText: 'Gender',
                    //value: _myActivity,
                    onSaved: (value) {
                      setState(() {
                        //_myActivity = value;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        //_myActivity = value;
                      });
                    },
                    dataSource: [
                      {
                        "display": "Male",
                        "value": "Male",
                      },
                      {
                        "display": "Female",
                        "value": "Female",
                      },
                    ],
                    textField: 'display',
                    valueField: 'value',
                  ),
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
                      labelText: 'Email',
                      //labelStyle: (size: textSizeSMedium),
                      labelStyle: TextStyle(
                          fontSize: textSizeSMedium
                      ),
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
                        labelStyle: TextStyle(
                            fontSize: textSizeSMedium
                        ),
                        // focusedBorder: UnderlineInputBorder(
                        //   borderSide: BorderSide(color: appStore.textPrimaryColor),
                        // ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: slShadowColor),
                        ),
                        filled: true,
                        suffixIcon: IconButton(
                          icon: Icon(
                              passwordVisible ? Icons.visibility : Icons.visibility_off,
                              color: slIconColor
                          ),
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
                  child: TextField(
                    //style: primaryTextStyle(),
                    obscureText: passwordVisibleConfirm,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(
                            fontSize: textSizeSMedium
                        ),
                        // focusedBorder: UnderlineInputBorder(
                        //   borderSide: BorderSide(color: appStore.textPrimaryColor),
                        // ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: slShadowColor),
                        ),
                        filled: true,
                        suffixIcon: IconButton(
                          icon: Icon(
                              passwordVisibleConfirm ? Icons.visibility : Icons.visibility_off,
                              color: slIconColor
                          ),
                          onPressed: () {
                            setState(() {
                              passwordVisibleConfirm = !passwordVisibleConfirm;
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
                      //text(t6_lbl_already_did_this),
                      Text(
                          'Already a member?'
                      ),
                      SizedBox(width: 4),
                      GestureDetector(
                        //child: Text(Sign I, style: TextStyle(fontSize: textSizeMedium, decoration: TextDecoration.underline, color: t6form_google)), onTap: () {})
                          child: Text(
                            'Log In',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: textSizeSmall
                            ),
                          ), onTap: () {})
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
                        height: MediaQuery.of(context).size.height*0.045,
                        buttonColor: slTextPrimaryColor,
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return EmailVerfication();
                                },
                              ),
                            );
                          },
                          child: Text(
                            'Create Account',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: textSizeNormal
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Container(

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //text(t6_lbl_already_did_this),
                      Text(
                          'Or Sign up with'
                      ),
                    ],
                  ),
                ),

                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(shape: BoxShape.circle, color: slTextPrimaryColor),
                        width: MediaQuery.of(context).size.width / 7.5,
                        height: MediaQuery.of(context).size.width / 7.5,
                        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 28),
                        child: SvgPicture.asset(google_fill, color: Colors.white, width: 20, height: 20),
                      ),
                      SizedBox(width: 20),
                      Container(
                        decoration: BoxDecoration(shape: BoxShape.circle, color: slTextPrimaryColor),
                        width: MediaQuery.of(context).size.width / 7.5,
                        height: MediaQuery.of(context).size.width / 7.5,
                        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 28),
                        child: SvgPicture.asset(facebook_fill, color: Colors.white),
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
