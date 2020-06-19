import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import './user.dart';

class Users with ChangeNotifier{
  List<User> _users = [];

  List<User> get users{
    return [..._users];
  }

  Future<void> addUser(User user) async {
    final url = 'https://samelocationsametaxi.firebaseio.com/users.json';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'name': user.name,
          'contactNo': user.contactNo,
          'username': user.username,
          'password': user.password,
        }),
      );
      final newUser = User(
        name: user.name,
        contactNo: user.contactNo,
        username: user.username,
        password: user.password,
        id: DateTime.now().toString(),
      );
      print(json.decode(response.body)['name']);
      _users.add(newUser);
      notifyListeners();
    } 
    catch (error) {
      print(error);
      throw error;
    }
  }
}