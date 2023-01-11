import 'package:flutter/material.dart';

class MyStyle {
 Text showTitle(String title) => Text(
  title,
  style: TextStyle(
    fontSize: 24.0,
    color: Colors.blue.shade100,
    fontWeight: FontWeight.bold,
  ),
);

  Container showLogo() {
    return Container(
      width: 120.0,
      child: Image.asset('assets/images/logo.png'),
    );
  }

  MyStyle();
}
