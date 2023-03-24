// ignore_for_file: unused_label, curly_braces_in_flow_control_structures, prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth/screen/homescreen.dart';

import 'cubit/cubit/auth_cubit.dart';
import 'screen/signinscreen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            buildwhen:
            (oldstate, newstate) {
              return oldstate is AuthInitial;
            };
            if (state is Authcodelogin) {
              return HomeScreen();
            } else {
              return SigninScreen();
            }
          },
        ),
      ),
    );
  }
}
