// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:demo/componets/squreTile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../componets/my_button.dart';
import '../componets/my_textfeal.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //controller
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  //signinuser method
  void signuserin() async {
    //show dialog
    showDialog(
        context: context,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usernameController.text, password: passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (e.code == "uer not found") {
        print("wrongemail");
        // wrongemailmessage();
      } else if (e.code == "wrong password") {
        print("password");
        // wrongpasswordmessage();
      }
    }
    Navigator.pop(context);
  }

  //dilog box

  // void wrongemailmessage() {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(title: Text("Email Not Foubnd"));
  //       });
  // }

  // void wrongpasswordmessage() {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(title: Text("Email Not Foubnd"));
  //       });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                //logo
                SizedBox(
                  height: 50,
                ),
                Icon(
                  Icons.lock,
                  size: 100,
                ),
                SizedBox(
                  height: 50,
                ),
                //welcoem back
                Text(
                  "Welcome Back ",
                  style: TextStyle(color: Colors.grey[700], fontSize: 16),
                ),
                SizedBox(
                  height: 25,
                ),
                //user name textf
                Mytextfeald(
                  controller: usernameController,
                  hinttext: "Username",
                  obscureText: false,
                ),
                SizedBox(
                  height: 10,
                ),
                //pass textf
                Mytextfeald(
                  controller: passwordController,
                  hinttext: "Password",
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),
                //forgot pass
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                //sign in button
                Mybutton(
                  onTap: signuserin,
                ),
                SizedBox(
                  height: 50,
                ),
                //or cont.. with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    children: [
                      Expanded(
                          child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[600],
                      )),
                      Text(" Or Continue With "),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[600],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),

                //google + apple
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SqureTile(
                          imagepath:
                              "https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-suite-everything-you-need-know-about-google-newest-0.png"),
                      SizedBox(
                        width: 15,
                      ),
                      SqureTile(
                          imagepath:
                              "https://www.freepnglogos.com/uploads/facebook-icons/small-facebook-icon-logo-16.png"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("not a member?"),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "register now",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                //not a mebber register now
              ],
            ),
          ),
        ),
      ),
    );
  }
}
