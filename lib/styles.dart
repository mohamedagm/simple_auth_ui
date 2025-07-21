import 'package:flutter/material.dart';

class Styles {
  static const Color kPrimaryColor = Color(0xFF9B28B2);
  ////////////
  static const TextStyle kLoginTitle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle kLoginSubtitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle kForgotPassword = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: kPrimaryColor,
  );

  static const TextStyle kSignUpHint = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle kSignUpLink = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: kPrimaryColor,
  );

  static const TextStyle kButtonText = TextStyle(
    fontSize: 20,
    color: Colors.white,
  );
}
