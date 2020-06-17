import 'package:flutter/material.dart';

class User with ChangeNotifier{

  final String id;
  final String name;
  final String contactNo;
  final String username;
  final String password;
  //image

  User({
    @required this.id,
    @required this.name,
    @required this.contactNo,
    @required this.username,
    @required this.password,
  });
}