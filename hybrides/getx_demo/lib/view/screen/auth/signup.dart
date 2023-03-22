// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/controller/auth_controler.dart';
import 'package:getx_demo/view/widget/glitch.dart';

import '../../widget/textinput.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var Home = Get.put(AuthController());
  TextEditingController email = TextEditingController();

  TextEditingController username = TextEditingController();

  TextEditingController setpassword = TextEditingController();

  TextEditingController confirmpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlithEffect(
                child: Text(
                  "Create Account".toUpperCase(),
                  textScaleFactor: 2,
                  style: TextStyle(fontWeight: FontWeight.w900),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  InkWell(
                    onTap: () {
                      AuthController.instance.pickimage();
                    },
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://t4.ftcdn.net/jpg/05/11/55/91/240_F_511559113_UTxNAE1EP40z1qZ8hIzGNrB0LwqwjruK.jpg"),
                      radius: 60,
                    ),
                  ),
                  Positioned(
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.blue,
                    ),
                    right: 10,
                  ),
                ],
              ),
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
                  controller: setpassword,
                  mylabeltext: "set password",
                  myicon: Icons.lock,
                  tohide: true,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Textinputfeald(
                  controller: confirmpassword,
                  mylabeltext: "confirm password",
                  myicon: Icons.lock,
                  tohide: true,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Textinputfeald(
                  controller: username,
                  mylabeltext: "username",
                  myicon: Icons.person,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: () {
                  AuthController.instance.signup(username.text, email.text,
                      setpassword.text, AuthController.instance.proimg);
                },
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    child: Text("SignUp")),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
