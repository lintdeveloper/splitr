import 'package:flutter/material.dart';

class User {
  User({@required this.firstName,
    @required this.lastName,
    @required this.photoUrl,
    @required this.email
  });

  final String firstName;
  final String lastName;
  final String photoUrl;
  final String email;
}