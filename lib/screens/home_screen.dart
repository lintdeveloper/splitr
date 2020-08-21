import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitr/mixins/mixins.dart';
import 'package:splitr/models/group/group.dart';
import 'package:splitr/providers/auth/auth_provider.dart';
import 'package:splitr/providers/groups/groups_provider.dart';
import 'package:splitr/screens/create_group_screen.dart';
import 'package:splitr/utils/utils.dart';
import 'package:splitr/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/homeScreen';

  HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    print(Provider.of<AuthProvider>(context, listen: false).status);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user;
    final group = Provider.of<GroupsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
              backgroundImage: NetworkImage(user.photoUrl),
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
              onPressed: () => Provider.of<AuthProvider>(context, listen: false)
                  .signOutWithGoogle())
        ],
      ),
      body: ResponsiveSafeArea(
        builder: (context, size) {
          return Container(
            child: SingleChildScrollView(
                child: Container(
                    height: size.height * .42,
                    color: LIGHT_BLUE_ACCENT,
                    child: FutureBuilder<List<GroupList>>(
                        future: group.getGroupList(email: user.email),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) print(snapshot.error);
                          return snapshot.hasData
                              ? GroupCards(groupsList: snapshot.data, user: user.email)
                              : Center(child: CircularProgressIndicator());
                        }))),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            Navigator.pushNamed(context, CreateGroupScreen.routeName),
        child: Icon(Icons.add),
      ),
    );
  }
}
