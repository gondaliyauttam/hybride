// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Mytextfeald extends StatelessWidget {
  final controller;
  final String hinttext;
  final bool obscureText;
  const Mytextfeald(
      {super.key,
      required this.controller,
      required this.hinttext,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hinttext,
            hintStyle: TextStyle(color: Colors.grey[500])),
      ),
    );
  }
}
