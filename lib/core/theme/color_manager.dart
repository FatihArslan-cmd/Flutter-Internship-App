import 'package:flutter/material.dart';

class CustomColorConstant {
  static final CustomColorConstant _instance = CustomColorConstant._init();
  static CustomColorConstant get instance => _instance;
  CustomColorConstant._init();

  final Color backgroundColor = Colors.white;
  final Color buttonBackgroundColor = Color(0xFFDBE8F2);
  final Color primaryTextColor = Color.fromARGB(255, 0, 0, 0);
  final Color textInputColor = Color(0xfff2f2f5);
  final Color subTextColor = Color.fromARGB(255, 166, 174, 186);
  final Color textSecondary = Color(0xFF757575);
  final Color toastSuccesMessage = Colors.green;
  final Color toastErrorMessage = Colors.red;
  final Color toastTextColor = Colors.white;
}
