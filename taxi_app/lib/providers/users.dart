import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import './user.dart';

class Users with ChangeNotifier{
  List<User> _users = [];

  final String authToken;
  final String userId;

  Users(this._users, this.authToken, this.userId);

  List<User> get users{
    return [..._users];
  }

  User findById(String id){
    return _users.firstWhere((user) => user.id == id);
  }

  Future<void> addUser(User user) async {
    final url = 'https://samelocationsametaxi.firebaseio.com/users.json?auth=$authToken';
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'name': user.name,
          'contactNo': user.contactNo,
          'username': user.username,
          'password': user.password,
          'creatorId': userId,
        }),
      );
      final newUser = User(
        name: user.name,
        contactNo: user.contactNo,
        username: user.username,
        password: user.password,
        id: json.decode(response.body)['name'],
      );
      _users.add(newUser);
      notifyListeners();
    } 
    catch (error) {
      print(error);
      throw error;
    }
  }
}