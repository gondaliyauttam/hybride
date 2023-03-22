// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:getx_demo/view/widget/glitch.dart';

import '../../../controller/auth_controler.dart';
import '../../widget/textinput.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GlithEffect(
                child: Text(
              "Login ".toUpperCase(),
              textScaleFactor: 2,
              style: TextStyle(fontWeight: FontWeight.w900),
            )),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Textinputfeald(
                controller: email,
                mylabeltext: "email",
                myicon: Icons.email,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Textinputfeald(
                controller: password,
                mylabeltext: "password",
                myicon: Icons.lock,
                tohide: true,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                AuthController.instance.login(email.text, password.text);
              },
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  child: Text("Login")),
            )
          ],
        ),
      ),
    );
  }
}
