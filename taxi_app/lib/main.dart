import 'package:flutter/material.dart';

import './screens/login_screen.dart';
import './screens/welcome_screen.dart';
import './screens/signup_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Same Location, Same Taxi',
      theme: ThemeData(
        primaryColor: Color(0xFF6F35A5),
        accentColor: Color(0xFFF1E6FF),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
      routes: {
        WelcomeScreen.routeName : (ctx) => WelcomeScreen(),
        LoginScreen.routeName : (ctx) => LoginScreen(),
        SignUpScreen.routeName : (ctx) => SignUpScreen(),
      },
    );
  }
}
