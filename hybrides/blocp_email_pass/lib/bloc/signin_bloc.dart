import 'package:bloc/bloc.dart';
import 'package:email_validator/email_validator.dart';
import 'package:meta/meta.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitialstate()) {
    on<SigninTextchangeEvent>((event, emit) {
      if (EmailValidator.validate(event.emailvalue) == false) {
        emit(SigninErrorlstate("please enter valid address"));
      } else if (event.passwordvalue.length < 8) {
        emit(SigninErrorlstate("please enter valid password"));
      } else {
        emit(Signinvalidstate());
      }
    });

    on<SubmitButton>((event, emit) {
      emit(Signinloadingstate());
    });
  }
}
