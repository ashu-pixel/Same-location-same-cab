import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {

  static const routeName = '/mainScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Same Location, Same Taxi'),),
      body: Center(child: Text('Main Screen'),)
    );
  }
}