part of 'signin_bloc.dart';

@immutable
abstract class SigninState {}

class SigninInitialstate extends SigninState {}


class Signinvalidstate extends SigninState {}

class SigninErrorlstate extends SigninState {
  final String errorMessage;
  SigninErrorlstate(this.errorMessage);
}

class Signinloadingstate extends SigninState {}
