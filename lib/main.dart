import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:splitr/providers/groups/groups_provider.dart';
import 'package:splitr/root.dart';
import 'package:splitr/router.dart';
import 'package:splitr/utils/utils.dart';
import 'providers/auth/auth_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(MultiProvider(
        child: App(),
        providers: [
          ChangeNotifierProvider(create: (context) => AuthProvider.instance()),
          ChangeNotifierProvider(create: (context) => GroupsProvider.instance())
        ]
      ))
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      home: RootScreen(),
      routes: Router.getRoutes(),
    );
  }
}