import 'package:flutter/material.dart';
import 'package:splitr/mixins/responsive_safe_area.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ResponsiveSafeArea(
          builder: (context, size) {
            return Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    color: Color.fromRGBO(239, 239, 239, 1),
                    height: size.height * .55,
                    width: size.width,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 6),
                          child: Center(
                            child: Text(
                              'Save and split bills with friends',
                              style: TextStyle(
                                  fontFamily: 'CircularStd-Medium',
                                  // fontWeight: FontWeight.w500,
                                  fontSize: 22,
                                  color: Color.fromRGBO(47, 41, 103, 1)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: Text(
                              'Create split groups with friends & colleagues to pay merchants',
                              style: TextStyle(
                                fontFamily: 'CircularStd-Book',
                                //fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Color.fromRGBO(64, 64, 64, 1),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * .03),
                        _signInButton(),
                        _createAccountButton(),
                        SizedBox(height: size.height * .05)
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        )
    );
  }


  Widget _signInButton() {
    return Container(
      height: 50.0,
      margin: EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(47, 41, 103, 1),
            style: BorderStyle.solid,
            width: 0.4,
          ),
          color:Color.fromRGBO(47, 41, 103, 1),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/images/google_logo.png"), height: 22.0),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                'Google Login',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    letterSpacing: .5,
                    color: Colors.white
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _createAccountButton() {
    return Container(
      height: 50.0,
      margin: EdgeInsets.fromLTRB(20, 8, 20, 8),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(47, 41, 103, 1),
            style: BorderStyle.solid,
            width: 0.4,
          ),
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Create an Account',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  letterSpacing: .5,
                  color: Color.fromRGBO(47, 41, 103, 1)
              ),
            )
          ],
        ),
      ),
    );
  }
}
