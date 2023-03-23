import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String? _verificationId;
  AuthCubit() : super(AuthInitial()) {
    User? currentUser = _auth.currentUser;

    if (currentUser != null) {
      //Login
      emit(Authcodelogin(currentUser));
    } else {
      //Logout
      emit(Authcodelogout());
    }
  }

  void sendotp(String phonenumber) async {
    emit(Authloading());
    await _auth.verifyPhoneNumber(
        phoneNumber: phonenumber,
        codeSent: (verificationId, forceResendingToken) {
          _verificationId = verificationId;
          emit(Authcodesent());
        },
        verificationCompleted: (phoneAuthCredential) {
          signinwithphone(phoneAuthCredential);
        },
        verificationFailed: (error) {
          emit(AuthcodeEroor(error.message.toString()));
        },
        codeAutoRetrievalTimeout: (verificationId) {
          _verificationId = verificationId;
        });
  }

  void verifyotp(String otp) async {
    emit(Authloading());

    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!, smsCode: otp);
    signinwithphone(credential);
  }

  void signinwithphone(PhoneAuthCredential credential) async {
    try {
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      if (userCredential.user != null) {
        emit(Authcodelogin(userCredential.user!));
      }
    } on FirebaseAuthException catch (ex) {
      emit(AuthcodeEroor(ex.message.toString()));
    }
  }

  void logout() async {
    await _auth.signOut();
    emit(Authcodelogout());
  }
}
