import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class UserModel{

  String userEmail;
  String userName;
  String userPassword;
  String userPhoneNumber;

  UserModel({
    this.userEmail,
    this.userName,
    this.userPassword,
    this.userPhoneNumber,
});
  static List<UserModel> users = [];
}
