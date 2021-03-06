import 'package:flutter/material.dart';

const String appName = "Splitr";
const double BUTTON_HEIGHT = 48;

const Color PURPLE_HUE = Color.fromRGBO(47, 41, 103, 1);
const Color GREEN_HUE = Color.fromRGBO(122, 169, 75, 1);

const Color LIGHT_GREEN_HUE = Color.fromRGBO(216, 231, 202, 1);
const Color DARK_BLUE_ACCENT = Color.fromRGBO(30, 138, 249, 1);
const Color LIGHT_BLUE_ACCENT = Color.fromRGBO(245, 245, 247, 1);

const Color BLACK = Color.fromRGBO(26, 25, 25, 1);

/// TextStyle
const TextStyle greenTextStyle =  TextStyle(fontSize: 16, color: GREEN_HUE, fontWeight: FontWeight.w600);
const BASE_URL = "https://us-central1-splitr-dedcc.cloudfunctions.net";

const int TIME_OUT_SECONDS = 30;
const int TIME_OUT_PROFILE_SECONDS = 90;
const String TIME_OUT_MSG = 'The request timed out';
const String SOCKET_EXCEPTION_MSG = 'No Internet connection';
const String ERROR_GOOGLE_SIGNIN_MSG = "Error Sign in User with Google";