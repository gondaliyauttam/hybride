// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:getx_demo/model/usermodel.dart';
import 'package:getx_demo/view/screen/auth/login.dart';
import 'package:image_picker/image_picker.dart';

import '../view/screen/homescreen.dart';

class AuthController extends GetxController {
//user state logout
  late Rx<User?> _user;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(FirebaseAuth.instance.currentUser);
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user, _setintialvalue);
  }

  _setintialvalue(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => Homescreen());
    }
  }

//image select
  static AuthController instance = Get.find();
  File? proimg;

  pickimage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final img = File(image.path);
    this.proimg = img;
  }

  //user resgister

  void signup(
    String username,
    String email,
    String password,
    File? image,
  ) async {
    try {
      if (username.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null) {
        UserCredential credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        String downloadurl = await _uploadprofile(image);

        UserModel user = UserModel(
            name: username,
            email: email,
            profilphoto: downloadurl,
            uid: credential.user!.uid);

        await FirebaseFirestore.instance
            .collection("user")
            .doc(credential.user!.uid)
            .set(user.toJson());
      } else {
        Get.snackbar(
            "errror creating account", "please enter all feald requerd");
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error occured", e.toString());
    }
  }

  Future<String> _uploadprofile(File image) async {
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("profilepic")
        .child(FirebaseAuth.instance.currentUser!.uid);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String imagedownurl = await snapshot.ref.getDownloadURL();
    return imagedownurl;
  }

  void login(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
      } else {
        Get.snackbar("Eroor login", "please enter all feald");
      }
    } catch (e) {
      Get.snackbar("Error login", e.toString());
    }
  }
}
