// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_auth/cubit/cubit/auth_cubit.dart';
import 'package:phone_auth/screen/homescreen.dart';

class VerifynumberScreen extends StatelessWidget {
  VerifynumberScreen({super.key});
  TextEditingController otpcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Verify OTP"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              children: [
                TextField(
                  controller: otpcontroller,
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
                    if (state is Authcodelogin) {
                      Navigator.popUntil(context, (route) => route.isFirst);
                      Navigator.pushReplacement(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => HomeScreen()));
                    } else if (state is AuthcodeEroor) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.error),
                          backgroundColor: Colors.red,
                         ),
                      );
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
                          child: Text("Verify"),
                          onPressed: () {
                            BlocProvider.of<AuthCubit>(context)
                                .verifyotp(otpcontroller.text);
                          }),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
