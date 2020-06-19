import 'package:flutter/material.dart';
import 'package:taxi_app/screens/bill_splitter.dart';
import '../screens/main_screen.dart';
import '../screens/profile.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        AppBar(
          title: Text('Hello Friend!', style: TextStyle(color: Colors.black),),
          automaticallyImplyLeading: false,
          backgroundColor: Theme.of(context).accentColor
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.people),
          title: Text('Connect to a Co-Passenger'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.directions_car),
          title: Text('Your Rides'),
          onTap: () {
            //Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.category),
          title: Text('Bill Splitter'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(BillSPlitterScreen.routeName);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Your Profile'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(ProfileScreen.routeName);
          },
        ),
        Divider(),
      ],),
    );
  }
}