import 'package:flutter/material.dart';
import 'package:splitr/screens/home_screen.dart';
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

class ShowDialog {
  ShowDialog({BuildContext context}) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return Center(child: CircularProgressIndicator(
          ),);
        });
  }
}

class ShowSuccessDialog {
  ShowSuccessDialog({BuildContext context, String msg}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          title:  Align(
            alignment: Alignment.topRight,
            child: IconButton(icon: Icon(Icons.close), onPressed: (){
              Navigator.of(context).pop();
            }),
          ),
          content: Container(
            child: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      width: 90.4,
                      height: 90.4,
                      margin: EdgeInsets.only(top: 20),
                      child: Image.asset('assets/images/success.png')),
                  new Text(
                    "Success",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18.0,
                        color: Color.fromRGBO(17, 17, 17, 1)),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 15),
                    child: new Text(
                      "$msg",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 14.0,
                          color: Color.fromRGBO(126, 126, 126, 1)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 30,bottom: 30),
                    width: MediaQuery.of(context).size.width,
                    height: 48,
                    child: RaisedButton(
                      elevation: 0,
                      color: PURPLE_HUE,
                      onPressed: () => Navigator.pushNamed(context, HomeScreen.routeName),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)
                      ),
                      child: Text(
                        'Go back home',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.normal,
                            letterSpacing: .5,
                            color: Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}