import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return  Scaffold(
        body: Container(
          color: Color.fromRGBO(47, 41, 103, 1),
          height: screenSize.height,
          width: screenSize.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            // mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Center(
                child: Text(
                  'WELCOME TO',
                  style: TextStyle(
                      fontFamily: 'CircularStd-Black',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: Color.fromRGBO(255, 255, 255, 1)),
                ),
              ),
              SizedBox(),
              Center(
                child: Text(
                  'Splitr',
                  style: TextStyle(
                      fontFamily: 'CircularStd-Black',
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Color.fromRGBO(255, 255, 255, 1)),
                ),
              )
            ],
          ),
        )
    );
  }
}
