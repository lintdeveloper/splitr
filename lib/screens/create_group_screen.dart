import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:splitr/mixins/mixins.dart';
import 'package:splitr/utils/consts.dart';
import 'package:splitr/utils/utils.dart';

class CreateGroupScreen extends StatefulWidget {
  static const routeName = '/createGroup';

  @override
  _CreateGroupScreenState createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends State<CreateGroupScreen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _controller = TextEditingController();
  static const _locale = 'en';

  String _groupName = "";
  String _amount = "";

  String _formatNumber(String string) {
    final format = NumberFormat.decimalPattern(_locale);
    return format.format(int.parse(string));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: ResponsiveSafeArea(
            builder: (context, size) => SingleChildScrollView(
                    child: Form(
                  key: _formKey,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 52,
                          color: Color.fromRGBO(255, 255, 255, 1),
                          padding: EdgeInsets.only(left: 16, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(LineIcons.times,
                                      color: Color.fromRGBO(51, 51, 51, 1))),
                              Text(
                                "Create split group",
                                style:
                                    TextStyle(color: PURPLE_HUE, fontSize: 16),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    final form = _formKey.currentState;
                                    form.save();
                                    print(_amount);
                                    print(_groupName);
                                    if ((_groupName != "") && (_amount != "")) {
                                      if (form.validate()) {
                                        print(_groupName);
                                        String amount = _amount
                                            .substring(1)
                                            .replaceAll('.', "")
                                            .replaceAll(",", "");
                                        print(amount);
                                      }
                                    } else if (_groupName != "" &&
                                        _amount == "") {
                                      ShowSnackBar(
                                          scaffoldKey: _scaffoldKey,
                                          msg: "Amount can\'t be empty");
                                    } else {
                                      ShowSnackBar(
                                          scaffoldKey: _scaffoldKey,
                                          msg: "Group name cannot be empty");
                                    }
                                  },
                                  child: Icon(LineIcons.check,
                                      color: Color.fromRGBO(51, 51, 51, 1))),
                            ],
                          ),
                        ),
                        SizedBox(height: size.height * 0.08),
                        Container(
                          margin: EdgeInsets.only(left: 16, right: 16),
                          child: Container(
                            padding: EdgeInsets.only(top: 4, bottom: 4),
                            child: Container(
                              child: TextFormField(
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(
                                        24.0, 2.0, 2.0, 12.0),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        borderSide: BorderSide(
                                            color:
                                                PURPLE_HUE.withOpacity(0.1))),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8)),
                                        borderSide: BorderSide(
                                            color:
                                                Colors.green.withOpacity(.8))),
                                    filled: false,
                                    hintText: "Enter group name"),
                                onSaved: (val) => _groupName = val,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16, right: 16, top: 8),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _controller,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(24.0, 2.0, 2.0, 12.0),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8)),
                                    borderSide: BorderSide(
                                        color: PURPLE_HUE.withOpacity(0.1))),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(8),
                                        bottomRight: Radius.circular(8)),
                                    borderSide: BorderSide(
                                        color: Colors.green.withOpacity(.8))),
                                suffixIcon: Icon(LineIcons.money),
                                filled: false,
                                hintText: "Amount"),
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly,
                              CurrencyInputFormatter()
                            ],
                            onSaved: (val) => _amount = val,
                          ),
                        )
                      ],
                    ),
                  ),
                ))));
  }
}
