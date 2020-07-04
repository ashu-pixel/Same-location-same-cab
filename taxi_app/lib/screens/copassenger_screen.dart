import 'package:flutter/material.dart';
import '../widgets/ui_Container.dart';
import 'package:provider/provider.dart';
import '../providers/request.dart';
import './main_screen.dart';

class CoPassenger extends StatelessWidget {

  final List<Map<String,dynamic>> passengers;
  final double startLocationLat; 
  final double startLocationLong; 
  final double endLocationLat; 
  final double endLocationLong; 
  final String mode; 
  final String alreadyinVehicle; 
  final DateTime time;
  final String name;
  final String contactNo;
  CoPassenger(
    this.passengers,
    this.startLocationLat,
    this.startLocationLong,
    this.endLocationLat,
    this.endLocationLong,
    this.mode,
    this.alreadyinVehicle,
    this.time,
    this.name,
    this.contactNo
  );

  dynamic showExitDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'Are you Sure?',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold
          ),
        ),
        content: Text(
          'You are about to exit, This will cancel your request',
          style: TextStyle(
            color: Theme.of(context).primaryColor
          ),
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              FlatButton(
                child: Text(
                  'Okay',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onPressed: () {
                  Navigator.of(ctx).pop();
                  Navigator.of(ctx).pushReplacementNamed(MainScreen.routeName);
                },
              ),
              FlatButton(
                child: Text(
                  'Leave Instead',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onPressed: () {
                  Provider.of<Request>(context, listen: false).postRequest(startLocationLat, startLocationLong, endLocationLat, endLocationLong, mode, alreadyinVehicle, time, name, contactNo);
                  Navigator.of(ctx).pop();
                  Navigator.of(ctx).pushReplacementNamed(MainScreen.routeName);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  dynamic showLeaveDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'Are you Sure?',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold
          ),
        ),
        content: Text(
          'You are about to leave, This will keep your request and inform you when a user matched',
          style: TextStyle(
            color: Theme.of(context).primaryColor
          ),
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              FlatButton(
                child: Text(
                  'Okay',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onPressed: () {
                  Navigator.of(ctx).pop();
                  Provider.of<Request>(context, listen: false).postRequest(startLocationLat, startLocationLong, endLocationLat, endLocationLong, mode, alreadyinVehicle, time, name, contactNo);
                  Navigator.of(ctx).pushReplacementNamed(MainScreen.routeName);
                },
              ),
              FlatButton(
                child: Text(
                  'Exit Instead',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                onPressed: () {
                  Navigator.of(ctx).pop();
                  Navigator.of(ctx).pushReplacementNamed(MainScreen.routeName);
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text('Matched Co-Passengers'),),
      body: Column(children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 10,
              child: passengers.length == 0 ? Center(child: Text('No Users Found'),) : ListView.builder(
                itemCount: passengers.length,
                itemBuilder: (context,index) {
                  return UiContainer(
                    ListTile(
                    //leading: Image,
                    title: Text(
                      passengers[index]['name'],
                      style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
                    ),
                    subtitle: Text(
                      passengers[index]['contactNo'],
                      style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 15),
                    ),
                    ),
                    Theme.of(context).accentColor,
                    size.width*0.6
                  );
                }
              ),
            ),
          ),
        AnimatedContainer(
          constraints: BoxConstraints(
            minHeight: passengers.length == 0 ? 60 : 0,
            maxHeight: passengers.length == 0 ? 120 : 0,
          ),
          duration: Duration(milliseconds: 400),
          curve: Curves.easeIn,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            UiContainer(
              FlatButton(
                child: Text('Exit', style: TextStyle(color: Colors.white),),
                onPressed: (){
                  showExitDialog(context);
                },
              ),
              Theme.of(context).primaryColor,
              size.width*0.3
            ),
            SizedBox(width: size.width*0.15,),
            UiContainer(
              FlatButton(
                child: Text('Leave', style: TextStyle(color: Colors.white),),
                onPressed: (){
                  showLeaveDialog(context);
                },
              ),
              Theme.of(context).primaryColor,
              size.width*0.3
            )
          ],),
        ),
        AnimatedContainer(
          constraints: BoxConstraints(
            minHeight: passengers.length != 0 ? 60 : 0,
            maxHeight: passengers.length != 0 ? 120 : 0,
          ),
          duration: Duration(milliseconds: 400),
          curve: Curves.easeIn,
          child: UiContainer(
            FlatButton(
              child: Text('Go Back', style: TextStyle(color: Colors.white)),
              onPressed: (){
                Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
              },
            ),
            Theme.of(context).primaryColor,
            size.width*0.8
          )
        ),
        SizedBox(height: size.height*0.02,)
        ],),
    );
  }
}