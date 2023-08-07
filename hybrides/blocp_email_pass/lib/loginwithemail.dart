// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterp/bloc/signin_bloc.dart';

class Loginemail extends StatelessWidget {
  Loginemail({super.key});

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("Login eith email"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: BlocBuilder<SigninBloc, SigninState>(
                builder: (context, state) {
                  if (state is SigninErrorlstate) {
                    return Text(
                      state.errorMessage,
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.red),
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: emailcontroller,
              onChanged: (val) {
                BlocProvider.of<SigninBloc>(context).add(SigninTextchangeEvent(
                    emailcontroller.text, passwordcontroller.text));
              },
              decoration: InputDecoration(hintText: "email"),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: passwordcontroller,
              onChanged: (val) {
                BlocProvider.of<SigninBloc>(context).add(
                  SigninTextchangeEvent(
                      emailcontroller.text, passwordcontroller.text),
                );
              },
              obscureText: true,
              decoration: InputDecoration(hintText: "password"),
            ),
            SizedBox(
              height: 20,
            ),
            BlocBuilder<SigninBloc, SigninState>(
              builder: (context, state) {
                if (state is Signinloadingstate) {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.black,
                  ));
                }

                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: (state is Signinvalidstate)
                          ? Colors.blue
                          : Colors.grey),
                  onPressed: () {
                    if (state is Signinvalidstate) {
                      BlocProvider.of<SigninBloc>(context).add(
                        SubmitButton(
                            emailcontroller.text, passwordcontroller.text),
                      );
                    }
                  },
                  child: Text('Login'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
