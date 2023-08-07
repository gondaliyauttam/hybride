// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:websocket/test1.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}
