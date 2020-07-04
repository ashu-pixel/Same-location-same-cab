import 'package:flutter/material.dart';
import 'package:taxi_app/screens/bill_splitter.dart';
import 'package:provider/provider.dart';
import 'package:taxi_app/screens/welcome_screen.dart';
import '../screens/rickshaw_rates_screen.dart';
import '../screens/taxi_rates_screens.dart';
import '../screens/main_screen.dart';
import '../screens/profile.dart';
import '../providers/auth.dart';
import './profilemodel.dart';

class AppDrawer extends StatelessWidget {
  final name = Profilee.mydefineduser['name'];
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(children: <Widget>[
        AppBar(
          title: Text('Hello $name', style: TextStyle(color: Colors.black),),
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
        // ListTile(
        //   leading: Icon(Icons.directions_car),
        //   title: Text('Your Rides'),
        //   onTap: () {
        //     //Navigator.of(context).pushReplacementNamed('/');
        //   },
        // ),
        // Divider(),
        ListTile(
          leading: Icon(Icons.category),
          title: Text('Bill Splitter'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(BillSPlitterScreen.routeName);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.local_taxi),
          title: Text('Taxi Rates'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(TaxiRatesScreen.routeName);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(Icons.tram),
          title: Text('Rickshaw Rates'),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(RickshawRatesScreen.routeName);
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
        ListTile(
          leading: Icon(Icons.power_settings_new),
          title: Text('Logout'),
          onTap: () {
            Provider.of<Auth>(context, listen: false).logout();
            Navigator.of(context).pop();
            Navigator.of(context).pushNamed(WelcomeScreen.routeName);
          },
        ),
      ],),
    );
  }
}