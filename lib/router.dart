import 'package:flutter/material.dart';
import 'package:splitr/screens/add_member_screen.dart';
import 'package:splitr/screens/create_group_screen.dart';
import 'package:splitr/screens/home_screen.dart';

class Router {

  /// Map used to define routes, to be supplied to [MaterialApp]
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      CreateGroupScreen.routeName: (context) => CreateGroupScreen(),
      HomeScreen.routeName: (context) => HomeScreen(),
      AddMemberScreen.routeName: (context) => AddMemberScreen()
    };
  }
}