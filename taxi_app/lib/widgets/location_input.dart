import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../screens/map_screen.dart';

class LocationInput extends StatefulWidget {

  final Function onSelectPlace;
  LocationInput(this.onSelectPlace,);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {

  double latitude;
  double longitude;

  Future<void> _getCurrentUserLocation() async {
    try {
      final locData = await Location().getLocation();
      widget.onSelectPlace(locData.latitude, locData.longitude);
      latitude = locData.latitude;
      longitude = locData.longitude;
      print(latitude);
      print(longitude);
    } catch (error) {
      return;
    }
  }

  Future<void> _selectOnMap() async {
    final selectedLocation = await Navigator.of(context).push<LatLng>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => MapScreen(isSelecting: true,),
      ),
    );
    if (selectedLocation == null) {
      return;
    }
    widget.onSelectPlace(selectedLocation.latitude, selectedLocation.longitude);
    latitude = selectedLocation.latitude;
    longitude = selectedLocation.longitude;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton.icon(
          icon: Icon(Icons.location_on,),
          label: Text('Current Location'),
          textColor: Theme.of(context).primaryColor,
          onPressed: _getCurrentUserLocation,
        ),
        FlatButton.icon(
          icon: Icon(Icons.map,),
          label: Text('Select on Map'),
          textColor: Theme.of(context).primaryColor,
          onPressed: _selectOnMap,
        ),
      ],
    );
  }
}

class LocationInputEnd extends StatefulWidget {
  final Function onSelectPlace;
  LocationInputEnd(this.onSelectPlace,);
  @override
  _LocationInputEndState createState() => _LocationInputEndState();
}

class _LocationInputEndState extends State<LocationInputEnd> {

  double latitude;
  double longitude;

  double getEndLatitude(){
    return latitude;
  }

  double getEndLongitude(){
    return longitude;
  }

  Future<void> _selectOnMap() async {
    final selectedLocation = await Navigator.of(context).push<LatLng>(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (ctx) => MapScreen(isSelecting: true,),
      ),
    );
    if (selectedLocation == null) {
      return;
    }
    widget.onSelectPlace(selectedLocation.latitude, selectedLocation.longitude);
    latitude = selectedLocation.latitude;
    longitude = selectedLocation.longitude;
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton.icon(
      icon: Icon(Icons.map,),
      label: Text('Select on Map'),
      textColor: Theme.of(context).primaryColor,
      onPressed: _selectOnMap
    );
  }
}