// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getx_demo/constance.dart';

class Textinputfeald extends StatelessWidget {
  final TextEditingController controller;
  final IconData myicon;
  final String mylabeltext;
  final bool tohide;

  Textinputfeald(
      {super.key,
      required this.controller,
      required this.myicon,
      required this.mylabeltext,
      this.tohide = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: tohide,
      controller: controller,
      decoration: InputDecoration(
        icon: Icon(myicon),
        labelText: mylabeltext,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: bordercolor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: bordercolor,
          ),
        ),
      ),
    );
  }
}
