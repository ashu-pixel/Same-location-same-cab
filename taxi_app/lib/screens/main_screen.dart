import 'package:flutter/material.dart';
import '../widgets/ui_Container.dart';
import '../models/app_drawer.dart';
import '../widgets/location_input.dart';
import '../models/place_location.dart';
import './main_screen2.dart';

class MainScreen extends StatelessWidget {

  static const routeName = '/mainScreen';

  @override
  Widget build(BuildContext context) {

    final _locationController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    PlaceLocation _pickedLocation;

    void _selectPlace(double lat, double lng) {
      _pickedLocation = PlaceLocation(latitude: lat, longitude: lng, address: " ");
      print(_pickedLocation);
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
                controller: _locationController,
                decoration: InputDecoration(
                  hintText: 'Select A Start Location',
                  icon: Icon(Icons.search),
                  focusColor: Theme.of(context).primaryColor
                ),
              ),
              Theme.of(context).accentColor,
              size.width*0.9
            ),
          ),
          LocationInput(_selectPlace),
          Container(
            margin: EdgeInsets.all(5),
            alignment: Alignment(0.0,0.0),
            width: size.width*0.9,
            child: UiContainer(
              TextField(
                controller: _locationController,
                decoration: InputDecoration(
                  hintText: 'Select An End Location',
                  icon: Icon(Icons.search),
                  focusColor: Theme.of(context).primaryColor
                ),
              ),
              Theme.of(context).accentColor,
              size.width*0.9
            ),
          ),
          LocationInputEnd(_selectPlace),
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
                  Navigator.of(context).pushNamed(MainScreen2.routeName);
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