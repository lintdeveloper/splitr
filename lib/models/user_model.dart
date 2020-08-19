import 'package:flutter/material.dart';

class User {
  User({@required this.displayName,
    @required this.photoUrl,
    @required this.email
  });

  final String displayName;
  final String photoUrl;
  final String email;

  Map<String, dynamic> toJson() => {
    "displayName": displayName,
    "email": email,
    "photoUrl": photoUrl
  };
}