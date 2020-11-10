import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slak/constant.dart';
import 'package:slak/components/customBar.dart';
import 'package:slak/screens/singup/select_dimensions.dart';

class EmailVerfication extends StatefulWidget {
  @override
  _EmailVerficationState createState() => _EmailVerficationState();
}

class _EmailVerficationState extends State<EmailVerfication> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  children: <Widget>[
                    Container(
                      child: Text(
                        ' Verify Your Account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: textSizeXXXLarge
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'We promise just one last step before embarking on your journey to living a better life ! We just need you to verify your email to finish setting up your account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: textSizeMedium,
                            color: slIconColor
                        ),
                      ),
                    ),
                    Align(
                      child: Container(
                        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                child: Text(
                                  'Step 1 of 2',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ),
                            Container(
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
                                          return SelectDimensions();
                                        },
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Done',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: textSizeNormal
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
