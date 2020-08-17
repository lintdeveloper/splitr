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
                        Center(
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
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/images/google_logo.png"), height: 35.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
