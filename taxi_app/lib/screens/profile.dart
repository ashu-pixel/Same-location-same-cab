import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/app_drawer.dart';
import 'package:provider/provider.dart';
import '../widgets/profile_firebase.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatelessWidget {

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Profile'),),
      body: Column(children: <Widget>[
        FlatButton(
          child: Text('Click'),
          onPressed: () {
            print('===============================');
          },
        ),
      ],),
      drawer: AppDrawer(),
    );
  }
}