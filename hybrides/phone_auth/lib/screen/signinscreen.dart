// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_auth/cubit/cubit/auth_cubit.dart';
import 'package:phone_auth/screen/verifyscreen.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({super.key});

  TextEditingController phonecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Sign in With Phone"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: phonecontroller,
              keyboardType: TextInputType.number,
              maxLength: 10,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Phone number",
                labelText: "Phone number",
                counterText: "",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is Authcodesent) {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => VerifynumberScreen()));
                }
              },
              builder: (context, state) {
                if (state is Authloading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: CupertinoButton(
                      color: Colors.blue,
                      child: Text("Sign In"),
                      onPressed: () {
                        String phonenumber = "+91" + phonecontroller.text;
                        BlocProvider.of<AuthCubit>(context)
                            .sendotp(phonenumber);
                      }),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
