import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 

import '../widgets/http_exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Auth with ChangeNotifier{
  String token;
  DateTime expiryDate;
  String userId;

  bool get isAuth {
    tryAutoLogin();
    if(token != null){
      return true;
    }
    return false;
  }
  

  Future<void> signup(String username, String password) async {
    final url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCE4eIGuIXww0YRBda6xsaN2fxzSiKY_cA';
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': username,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      print('authenticated');
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<bool> tryAutoLogin()async{
    final prefs = await SharedPreferences.getInstance();
    token = prefs.get('token');
    //print('=================================================================');
    //print(token);
    if(token == null){
      return false;
    }
    notifyListeners();
    return true;
  } 

  Future<void> logout() async{
    token = null;
    userId = null;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    //prefs.remove('userId');
    prefs.clear();
  }

}