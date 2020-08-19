import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitr/screens/screens.dart';
import 'package:splitr/services/auth/auth-service.dart';

class RootScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, AuthService auth, _) {
      switch (auth.status) {
        case Status.Uninitialized:
          return SplashScreen();
        case Status.Unauthenticated:
        case Status.Authenticating:
          return LoginScreen();
        case Status.Authenticated:
          return HomeScreen(user: auth.user);
        default:
          return Container();
      }
    });
  }
}
