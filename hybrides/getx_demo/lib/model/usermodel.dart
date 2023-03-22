import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserModel {
  String name;
  String profilphoto;
  String email;
  String uid;

  UserModel({
    required this.name,
    required this.email,
    required this.profilphoto,
    required this.uid,
  });
  Map<String, dynamic> toJson() => {
        "name": name,
        "email ": email,
        "profilphoto": profilphoto,
        "uid": uid,
      };

  static UserModel fromsnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      email: snapshot['email'],
      name: snapshot['name'],
      profilphoto: snapshot['profilphoto'],
      uid: snapshot['uid'],
    );
  }
}
