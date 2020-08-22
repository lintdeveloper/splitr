import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import 'package:splitr/mixins/index.dart';
import 'package:splitr/models/index.dart';
import 'package:splitr/providers/auth/auth_provider.dart';
import 'package:splitr/providers/groups/groups_provider.dart';
import 'package:splitr/utils/consts.dart';
import 'package:splitr/utils/utils.dart';

class AddMemberScreen extends StatefulWidget {
  static const routeName = '/addMember';

  @override
  _AddMemberScreenState createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _groupController = TextEditingController();
  final _amountController = TextEditingController();
  String _groupName = "";
  String _amount = "";

  @override
  void dispose() {
    _groupController.clear();
    _amountController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final group = Provider.of<GroupsProvider>(context);
    final user = Provider.of<AuthProvider>(context).user;

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
                                "Add Member to ${group.groupId}",
                                style:
                                    TextStyle(color: PURPLE_HUE, fontSize: 16),
                              ),
                              GestureDetector(
                                  onTap: () async {
                                    final form = _formKey.currentState;
                                    form.save();

                                    if ((_groupName != "") && (_amount != "")) {
                                      if (form.validate()) {
                                        ShowDialog(context: context);
                                        String amount = _amount
                                            .substring(1)
                                            .replaceAll('.', "")
                                            .replaceAll(",", "");

                                        ApiResponse result = await group.createGroup(
                                            email: user.email,
                                            groupRequest: GroupRequest(
                                                name: _groupName,
                                                amount: amount)
                                                .toJson());
                                          _groupName = "";

                                          _groupController.clear();
                                          _amountController.clear();

                                        if(result.status) {
                                          Navigator.of(context).pop();
                                          ShowSuccessDialog(context: context, msg: result.message);
                                        } else {
                                          Navigator.of(context).pop();
                                          ShowSnackBar(scaffoldKey: _scaffoldKey, msg: result.message);
                                        }

                                      }
                                    } else if (_groupName != "" &&
                                        _amount == "") {
                                      ShowSnackBar(
                                          scaffoldKey: _scaffoldKey,
                                          msg: "Amount can\'t be empty");
                                    } else {
                                      ShowSnackBar(
                                          scaffoldKey: _scaffoldKey,
                                          msg: "Email cannot be empty");
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
                                keyboardType: TextInputType.emailAddress,
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
                                    hintText: "Enter email"),
                                onSaved: (val) => _groupName = val,
                                controller: _groupController,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16, right: 16, top: 8),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: _amountController,
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
