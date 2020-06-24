import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import '../providers/auth.dart';

class Profile with ChangeNotifier{

  Future<void> fetchProfile(BuildContext context) async{

    final String userId = await Provider.of<Auth>(context, listen: false).getCurrentUserId();

    print('in Function');
    print(userId);
    final url = 'https://samelocationsametaxi.firebaseio.com/users/$userId.json';
    final response = await http.get(url);
    print('url fetched');
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      print('in null');
      return;
    }
    print(extractedData['name']);
  }
}