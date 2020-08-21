import 'package:flutter/material.dart';
import 'package:splitr/models/models.dart';
import 'package:splitr/utils/utils.dart';

class MemberItem extends StatelessWidget {
  final int index;
  final String email;
  final String photoUrl;
  final String displayName;
  final String amount;
  final String user;

  const MemberItem(
      {Key key,
      this.index,
      this.email,
      this.photoUrl,
      this.displayName,
      this.amount,
      this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Column(
        children: <Widget>[
          CircleAvatar(
              backgroundImage: NetworkImage(photoUrl),
              backgroundColor: LIGHT_BLUE_ACCENT),
          Container(
              margin: EdgeInsets.only(top: 3),
              child: Text(
                  email == user
                      ? "You"
                      : "$displayName",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                  overflow: TextOverflow.ellipsis))
        ],
      ),
    );
  }
}
