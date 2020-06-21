import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Profile with ChangeNotifier{

  final userId;
  final authToken;

  Profile(this.userId,this.authToken);

  Future<void> fetchProfile() async{
    print('in Function');
    print(userId);
    final url = 'https://samelocationsametaxi.firebaseio.com/users/$userId.json';
    final response = await http.get(url);
    print('url fetched');
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      print('null');
      return;
    }
    print(extractedData);
  }
}