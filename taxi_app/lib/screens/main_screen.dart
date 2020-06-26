import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import '../widgets/ui_Container.dart';
import '../models/app_drawer.dart';
import '../widgets/location_input.dart';
import '../models/place_location.dart';
import './main_screen2.dart';

class MainScreen extends StatefulWidget{

  static const routeName = '/mainScreen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  final _locationStartController = TextEditingController();
  final _locationEndController = TextEditingController();
  PlaceLocation _pickedStartLocation;
  PlaceLocation _pickedEndLocation;

  Future<Address> convertToAddress(double latitude, double longitude)async{
      final coordinates = new Coordinates(latitude, longitude);
      var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
      var first = addresses.first;
      return first;
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    void _selectStartPlace(double lat, double lng) {
      _pickedStartLocation = PlaceLocation(latitude: lat, longitude: lng, address: " ");
      print(_pickedStartLocation);
    }

    void _selectEndPlace(double lat, double lng) {
      _pickedEndLocation = PlaceLocation(latitude: lat, longitude: lng, address: " ");
      print(_pickedEndLocation);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Same Location, Same Taxi'),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          SizedBox(height: size.height*0.01,),
          Container(
            margin: EdgeInsets.all(5),
            alignment: Alignment(0.0,0.0),
            width: size.width*0.9,
            child: UiContainer(
              TextField(
                controller: _locationStartController,
                decoration: InputDecoration(
                  hintText: 'Select a Start Location',
                  icon: Icon(Icons.search),
                  focusColor: Theme.of(context).primaryColor,
                  labelText: _pickedStartLocation!=null ? convertToAddress(_pickedStartLocation.latitude, _pickedStartLocation.longitude).toString() : null,
                ),
              ),
              Theme.of(context).accentColor,
              size.width*0.9
            ),
          ),
          LocationInput(_selectStartPlace),
          Container(
            margin: EdgeInsets.all(5),
            alignment: Alignment(0.0,0.0),
            width: size.width*0.9,
            child: UiContainer(
              TextField(
                controller: _locationEndController,
                decoration: InputDecoration(
                  hintText: 'Select An End Location',
                  icon: Icon(Icons.search),
                  focusColor: Theme.of(context).primaryColor,
                  ///labelText: convertToAddress(_pickedEndLocation.latitude, _pickedEndLocation.longitude).toString(),
                ),
              ),
              Theme.of(context).accentColor,
              size.width*0.9
            ),
          ),
          LocationInputEnd(_selectEndPlace),
          SizedBox(height: size.height*0.01,),
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(10),
            child: UiContainer(
              FlatButton(
                color: Theme.of(context).primaryColor,
                //icon: Icon(Icons.keyboard_arrow_right, color: Colors.white,),
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.white)
                ),
                onPressed: (){
                  var route = new MaterialPageRoute(
                    builder: (BuildContext ctx) => new MainScreen2(
                      startLat: _pickedStartLocation.latitude,
                      startLong: _pickedStartLocation.longitude,
                      endLat: _pickedEndLocation.latitude,
                      endLong: _pickedEndLocation.longitude,
                    ),
                  );
                  Navigator.of(context).push(route);
                  print(_pickedStartLocation.latitude);
                  print(_pickedStartLocation.longitude);
                  print(_pickedEndLocation.latitude);
                  print(_pickedEndLocation.longitude);
                  var startaddress = convertToAddress(_pickedStartLocation.latitude, _pickedStartLocation.longitude);
                  print(startaddress);
                  var endaddress = convertToAddress(_pickedEndLocation.latitude, _pickedEndLocation.longitude);
                  print(endaddress);
                },
              ),
              Theme.of(context).primaryColor,
              size.width*0.4,
            ),
          )
        ],),
      ),
      drawer: AppDrawer(),
    );
  }
}