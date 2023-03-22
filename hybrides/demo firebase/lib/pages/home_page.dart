// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});
  final user = FirebaseAuth.instance.currentUser!;

  void signuserout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: signuserout, icon: Icon(Icons.logout_rounded))
        ],
      ),
      body: Center(
        child: Text("LogedIn:" + user.email!),
      ),
    );
  }
}
