import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';

class SplashScreen extends StatelessWidget {

  static const routeName = '/splash';
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

