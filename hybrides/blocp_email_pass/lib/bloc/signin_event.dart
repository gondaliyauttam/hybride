part of 'signin_bloc.dart';

@immutable
abstract class SigninEvent {}

class SigninTextchangeEvent extends SigninEvent {
  final String emailvalue;
  final String passwordvalue;

  SigninTextchangeEvent(this.emailvalue, this.passwordvalue);
}

class SubmitButton extends SigninEvent {
  final String email;
  final String password;

  SubmitButton(this.email, this.password);
}
