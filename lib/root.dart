import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitr/enums/auth_status.dart';
import 'package:splitr/screens/create_group_screen.dart';
import 'package:splitr/screens/screens.dart';

import 'providers/auth/auth_provider.dart';

class RootScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, AuthProvider auth, _) {
      switch (auth.status) {
        case Status.Uninitialized:
          return SplashScreen();
        case Status.Unauthenticated:
        case Status.Authenticating:
        case Status.AccountSettingUp:
          return LoginScreen();
        case Status.CreateGroup:
          return CreateGroupScreen();
        case Status.Authenticated:
          return HomeScreen();
        default:
          return Container();
      }
    });
  }
}
