// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class SqureTile extends StatelessWidget {
  final String imagepath;
  const SqureTile({super.key, required this.imagepath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16)),
      child: Image.network(
        imagepath,
        height: 50,
      ),
    );
  }
}
