import 'package:flutter/material.dart';
import 'package:splitr/utils/consts.dart';

class ShowSnackBar {
  ShowSnackBar({GlobalKey<ScaffoldState> scaffoldKey, String msg, Duration duration}) {
    final snackBar = SnackBar(
      backgroundColor: BLACK,
      content: Text(
        '$msg',
        textAlign: TextAlign.center,
        style: new TextStyle(
            height: 1.5,
            color: Colors.white,
            fontSize: 14.0,
            fontWeight: FontWeight.w600),
      ),
      duration: Duration(seconds: 5),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }
}
