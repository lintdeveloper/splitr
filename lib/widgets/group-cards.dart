import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:splitr/models/models.dart';
import 'package:splitr/utils/utils.dart';
import 'package:splitr/widgets/widgets.dart';

class GroupCards extends StatefulWidget {
  @override
  _GroupCardsState createState() => _GroupCardsState();
}

class _GroupCardsState extends State<GroupCards> {
  int _index = 0;
  int _itemLength = 5;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: <Widget>[
        Expanded(
          child: PageView.builder(
            itemCount: _itemLength,
            controller: PageController(viewportFraction: 0.8),
            onPageChanged: (int index) => setState(() => _index = index),
            itemBuilder: (_, i) {
              return Transform.scale(
                scale: i == _index ? 1 : 0.9,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Card(
                    elevation: 0.5,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      margin: EdgeInsets.all(8),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Sandwich", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                              RichText(text: TextSpan(
                                text: "₦ ",
                                style: TextStyle(fontSize: 12, color: BLACK.withOpacity(0.6)),
                                children: [
                                  new TextSpan(
                                    text: '20,000.00',
                                    style: TextStyle(fontSize: 14, color: BLACK),
                                  )
                                ]
                              ))
                            ],
                          ),
                          SizedBox(height: 12),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: membersList.length,
                              itemBuilder: (context, index) => MemberItem(index, "musabrillz@gmail.com")

                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(LineIcons.plus_circle, size: 26),
                                    Container(
                                        margin: EdgeInsets.only(left: 4),
                                        child: Text("Add a member"))
                                  ],
                                ),
                              ),
                              Icon(LineIcons.angle_right, size: 24,)
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
              dotsCount: _itemLength,
              position: double.parse(_index.toString()),
              decorator: DotsDecorator(
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 8.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)
                ),
                spacing: EdgeInsets.symmetric(horizontal: 3, vertical: 6)
              ),
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
}
