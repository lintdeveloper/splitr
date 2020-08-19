import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitr/mixins/mixins.dart';
import 'package:splitr/services/services.dart';
import 'package:splitr/utils/utils.dart';
import 'package:splitr/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.user}) : super(key: key);

  final FirebaseUser user;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
              backgroundImage: NetworkImage(widget.user.photoUrl),
              backgroundColor: LIGHT_BLUE_ACCENT),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "Splitr",
          style: TextStyle(
              color: BLACK, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        elevation: 0.4,
        actions: [
          IconButton(
              icon: Icon(CupertinoIcons.clear_thick, color: PURPLE_HUE),
              onPressed: () =>
                  Provider.of<AuthService>(context, listen: false).signOutWithGoogle())
        ],
      ),
      body: ResponsiveSafeArea(
        builder: (context, size) {
          return Container(
            child: ListView(
              children: <Widget>[
                Container(
                    height: size.height * .42,
                    color: LIGHT_BLUE_ACCENT,
                    child: GroupCards())
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}
