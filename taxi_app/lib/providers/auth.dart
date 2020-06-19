import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 

import '../widgets/http_exception.dart';

class Auth with ChangeNotifier{
  String _token;
  DateTime _expiryDate;
  String _userId;

  bool get isAuth {
    return token != null;
  }

  String get token {
    if (_expiryDate != null && _expiryDate.isAfter(DateTime.now()) && _token != null) {
      return _token;
    }
    return null;
  }

  String get userId {
    return _userId;
  }

  Future<void> _authenticate(String username, String password, String urlSegment) async {
    final url =
      'https://identitytoolkit.googleapis.com/v1/accounts:$urlSegment?key=AIzaSyCE4eIGuIXww0YRBda6xsaN2fxzSiKY_cA';
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
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      print('authenticated');
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }
  
  Future<void> signup(String username, String password) async{
    _authenticate(username, password, 'signUp'); 
  }

  Future<void> login(String username, String password) async{
    print('login');
    _authenticate(username, password, 'signInWithPassword');
    print('loggedIn');   
  }
}