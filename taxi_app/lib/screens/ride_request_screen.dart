import 'package:flutter/material.dart';
import 'package:taxi_app/models/app_drawer.dart';
import'../models/profilemodel.dart';

class RideRequests extends StatelessWidget {

  static const routeName = '/ride-request';

  final name = Profilee.mydefineduser['name'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Ride Requests'),),
      drawer: AppDrawer(),
    );
  }
}