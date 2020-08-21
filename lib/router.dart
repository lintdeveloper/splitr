import 'package:flutter/material.dart';
import 'package:splitr/screens/create_group_screen.dart';

class Router {

  /// Map used to define routes, to be supplied to [MaterialApp]
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      CreateGroupScreen.routeName: (context) => CreateGroupScreen()
    };
  }
}