import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_drawer.dart';
import '../widgets/profile_firebase.dart';

class ProfileScreen extends StatelessWidget {

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Profile'),),
      body: Column(children: <Widget>[
        FlatButton(
          child: Text('Click'),
          onPressed: () => Provider.of<Profile>(context, listen: false).fetchProfile(context),
        ),
      ],),
      drawer: AppDrawer(),
    );
  }
}