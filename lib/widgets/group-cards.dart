import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:splitr/models/group/group.dart';
import 'package:splitr/providers/groups/groups_provider.dart';
import 'package:splitr/screens/add_member_screen.dart';
import 'package:splitr/utils/utils.dart';
import 'package:splitr/widgets/widgets.dart';

class GroupCards extends StatefulWidget {
  List<GroupList> groupsList;
  String user;

  GroupCards({Key key, this.groupsList, this.user}) : super(key: key);

  @override
  _GroupCardsState createState() => _GroupCardsState();
}

class _GroupCardsState extends State<GroupCards> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final group = Provider.of<GroupsProvider>(context);

    Size size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Expanded(
          child: PageView.builder(
            itemCount: widget.groupsList.length,
            controller: PageController(viewportFraction: 0.8),
            onPageChanged: (int index) => setState(() => _index = index),
            itemBuilder: (_, i) {
              return Transform.scale(
                scale: i == _index ? 1 : 0.9,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Card(
                    elevation: 0.5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      margin: EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("${widget.groupsList[i].name}",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                              RichText(
                                  text: TextSpan(
                                      text: "₦ ",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: BLACK.withOpacity(0.6)),
                                      children: [
                                    new TextSpan(
                                      text: '${widget.groupsList[i].amount}',
                                      style:
                                          TextStyle(fontSize: 14, color: BLACK),
                                    )
                                  ]))
                            ],
                          ),
                          SizedBox(height: 12),
                          Expanded(
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: widget.groupsList[i].members.length,
                                itemBuilder: (context, index) {
                                  final member =
                                      widget.groupsList[index].members[index];
                                  return MemberItem(
                                    amount: member.amount,
                                    displayName: member.displayName,
                                    email: member.email,
                                    photoUrl: member.photoUrl,
                                    user: widget.user,
                                  );
                                }),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: GestureDetector(
                                  onTap: () => {
                                    group.setGroupId =widget.groupsList[i].name,
                                    Navigator.of(context).pushNamed(AddMemberScreen.routeName)
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Icon(LineIcons.plus_circle, size: 26),
                                      Container(
                                          margin: EdgeInsets.only(left: 4),
                                          child: Text("Add a member"))
                                    ],
                                  ),
                                ),
                              ),
                              Icon(
                                LineIcons.angle_right,
                                size: 24,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 8),
          child: AnimatedContainer(
            duration: Duration(milliseconds: 150),
            child: DotsIndicator(
              dotsCount: widget.groupsList.length,
              position: double.parse(_index.toString()),
              decorator: DotsDecorator(
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 8.0),
                  activeColor: PURPLE_HUE,
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  spacing: EdgeInsets.symmetric(horizontal: 3, vertical: 6)),
            ),
          ),
//                        child: Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: <Widget>[
//                            for (int i = 0; i < _index; i++)
//                              i == _index? SlideDot(true): SlideDot(false)
//
//                          ],
//                        ),
        ),
      ],
    );
  }

  String formatPrice(String price){
      String _price = (int.parse(price) * 100).toStringAsFixed(2);

      return _price;
  }
}
