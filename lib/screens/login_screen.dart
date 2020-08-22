import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:splitr/enums/auth_status.dart';
import 'package:splitr/mixins/responsive_safe_area.dart';
import 'package:splitr/models/api_response_model.dart';
import 'package:splitr/providers/auth/auth_provider.dart';
import 'package:splitr/utils/consts.dart';
import 'package:splitr/utils/utils.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context);

    return Scaffold(
        key: _key,
        body: ResponsiveSafeArea(
          builder: (context, size) {
            return SingleChildScrollView(
              child: Container(
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
                                style: Theme.of(context).textTheme.headline3
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Center(
                              child: Text(
                                'Create split groups with friends & colleagues to pay merchants',
                                style: Theme.of(context).textTheme.bodyText2,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * .03),
                          _signInButton(user),
                          _createAccountButton(user),
                          SizedBox(height: size.height * .05)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        )
    );
  }


  Widget _signInButton(AuthProvider user) {

    return GestureDetector(
      onTap: () async {
        ApiResponse apiResponse = await user.signInWithGoogle();

        if (!apiResponse.status) {
          ShowSnackBar(scaffoldKey: _key, msg: apiResponse.message);
        }
      },
      child: user.status == Status.Authenticating ?
      Center(child: SpinKitWave(color: PURPLE_HUE, type: SpinKitWaveType.center)) :Container(
        height: 50.0,
        margin: EdgeInsets.fromLTRB(20, 8, 20, 8),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: PURPLE_HUE,
              style: BorderStyle.solid,
              width: 0.4,
            ),
            color:PURPLE_HUE,
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
      ),
    );
  }

  Widget _createAccountButton(AuthProvider user) {
    print(user.status);

    return GestureDetector(
      onTap: () async {
        ApiResponse apiResponse = await user.setUpWithGoogle();

        if (apiResponse.status) {
          ShowSnackBar(scaffoldKey: _key, msg: apiResponse.message);
        } else {
          ShowSnackBar(scaffoldKey: _key, msg: apiResponse.message);
        }},
      child: user.status == Status.AccountSetup ?
      Center(child: SpinKitWave(color: PURPLE_HUE, type: SpinKitWaveType.center)) : Container(
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
      ),
    );
  }


  void errorCallback(String msg) {
    Navigator.of(context).pop();
    ShowSnackBar(scaffoldKey: _key, msg: msg);
  }
}


