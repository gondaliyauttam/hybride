part of 'auth_cubit.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class Authloading extends AuthState {}

class Authcodesent extends AuthState {}

class Authcodeverify extends AuthState {}

class Authcodelogin extends AuthState {
  final User firebaseuser;

  Authcodelogin(this.firebaseuser);
}

class Authcodelogout extends AuthState {}

class AuthcodeEroor extends AuthState {
  final String error;
  AuthcodeEroor(this.error);
}
