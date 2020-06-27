import 'package:flutter/material.dart';
import '../widgets/ui_Container.dart';
import 'package:provider/provider.dart';
import '../providers/request.dart';

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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Provider.of<Request>(context, listen: false).postRequest(startLocationLat, startLocationLong, endLocationLat, endLocationLong, mode, alreadyinVehicle, time, name, contactNo);

    return Scaffold(
      appBar: AppBar(title: Text('Matched Co-Passengers'),),
      body: Column(children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 10,
              child: ListView.builder(
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
        ],),
    );
  }
}