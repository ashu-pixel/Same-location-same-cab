import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Profile with ChangeNotifier{
  
  String _email;
  String finalName;
  String finalNo;

  String getName(){
    fetchProfile().then((value){
      return finalName;
    });
    return finalName;
  }
  
  Future fetchProfile() async{

    print('in Function');
    String emailFinal;

    Future getEmail()async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      emailFinal = prefs.get("email");
      print(emailFinal);
    }

    String getmail(){
      getEmail().then((value) {
        return emailFinal;
      });
      return emailFinal;
    }

    _email = getmail();
    print(_email);
    print('=======================================================');
    print('========================================================');
    print(_email);

    final url = 'https://samelocationsametaxi.firebaseio.com/users.json';
    final response = await http.get(url);
    print('url fetched');
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    if (extractedData == null) {
      print('in null');
      return;
    }
    print(extractedData);
    extractedData.forEach((id, user){
      if(emailFinal == user['username']){
        print('======================================================================');
        //print(user['name']);
        //print(user['contactNo']);
        String nameu = user['name'];
        String contactNo = user['contactNo'];
        print(nameu);
        print(contactNo);
        finalName = nameu;
        finalNo = contactNo;
        print("Name{$finalName}");
      }
    });
  }
}