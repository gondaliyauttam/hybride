// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_auth/cubit/cubit/auth_cubit.dart';
import 'package:phone_auth/screen/signinscreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Home"),
      ),
      body: Center(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is Authcodelogout) {
              Navigator.popUntil(context, (route) => route.isFirst);
              Navigator.pushReplacement(context,
                  CupertinoPageRoute(builder: (context) => SigninScreen()));
            }
          },
          builder: (context, state) {
            return TextButton(
              child: Text(
                'Logout',
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ),
              onPressed: () {
                BlocProvider.of<AuthCubit>(context).logout();
              },
            );
          },
        ),
      ),
    );
  }
}
