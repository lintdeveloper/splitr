
import 'package:flutter/material.dart';

class Member {
  final String memberImageUrl;
  final String memberFirstName;
  final String memberLastName;
  final String memberEmail;

  Member(
      {@required this.memberImageUrl,
      @required this.memberFirstName,
      @required this.memberLastName,
      @required this.memberEmail});
}

final membersList = [
  Member(
      memberImageUrl: "https://images.unsplash.com/profile-1546801126806-60bc"
          "73bbbee0?dpr=1&auto=format&fit=crop&w=150&h=150&q=60&crop=faces&bg=fff",
      memberFirstName: "Musa",
      memberLastName: "Musa",
      memberEmail: "musabrillz@gmail.com"),
  Member(
      memberImageUrl:
          "https://images.unsplash.com/profile-1530456677759-61e93a4dabae?dpr=1"
              "&auto=format&fit=crop&w=150&h=150&q=60&crop=faces&bg=fff",
      memberFirstName: "Scott",
      memberLastName: "Tobin",
      memberEmail: "scottbin@gmail.com"),
  Member(
      memberImageUrl: "https://images.unsplash.com/profile-1583372923662-bec0a98e8c86"
          "image?dpr=1&auto=format&fit=crop&w=150&h=150&q=60&crop=faces&bg=fff",
      memberFirstName: "Keitravis",
      memberLastName: "Squire",
      memberEmail: "keitravis@gmail.com"),
  Member(
      memberImageUrl: "https://images.unsplash.com/profile-1564394790657-b813338781bb?"
          "dpr=1&auto=format&fit=crop&w=150&h=150&q=60&crop=faces&bg=fff",
      memberFirstName: "Anastasia",
      memberLastName: "Vityukova",
      memberEmail: "Anastasia@gmail.com")
];
