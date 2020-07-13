import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_app/screens/main_screen.dart';
import '../models/profilemodel.dart';
import 'package:taxi_app/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {

  static const routeName = '/splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Future<void> auth()async{
    String token;

    final prefs = await SharedPreferences.getInstance();
    token = prefs.get('token');

    print(token);
    if(token == null){
      Navigator.of(context).pushReplacementNamed(WelcomeScreen.routeName);
    }else {
      String email = prefs.get('email');
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
      if(email == user['username']){
        print('======================================================================');
        String nameu = user['name'];
        String contactNo = user['contactNo'];
        print(nameu);
        print(contactNo);
        print(user);
        Profilee.mydefineduser=user;
        print(email);
      }
      });
      Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
    }         
  }

  @override
  void initState(){
    auth();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // bool check = Provider.of<Auth>(context).isAuth;
    // print(check);
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body:Center(
        child: JumpingText(
          'Loading...',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}

