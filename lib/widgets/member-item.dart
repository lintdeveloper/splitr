import 'package:flutter/material.dart';
import 'package:splitr/models/models.dart';
import 'package:splitr/utils/utils.dart';

class MemberItem extends StatelessWidget {
  final int index;
  final String user;

  MemberItem(this.index, this.user);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Column(
        children: <Widget>[
          CircleAvatar(
              backgroundImage: NetworkImage(membersList[index].memberImageUrl),
              backgroundColor: LIGHT_BLUE_ACCENT),
          Container(
              margin: EdgeInsets.only(top: 3),
              child: Text(
                membersList[index].memberEmail == user
                    ? "You"
                    : "${membersList[index].memberFirstName}" +
                        " " +
                        "${membersList[index].memberLastName}",
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal),
                overflow: TextOverflow.ellipsis
              ))
        ],
      ),
    );
  }
}
