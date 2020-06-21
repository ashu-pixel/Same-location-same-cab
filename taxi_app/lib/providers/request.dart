import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Request with ChangeNotifier{
  // PlaceLocation startLocation;
  // PlaceLocation endLocation;
  // String mode;
  // String alreadyinVehicle;
  // DateTime time;

  Future<void> searchPassenger(double startLocationLat, double startLocationLong, double endLocationLat, double endLocationLong, String mode, String alreadyinVehicle, DateTime time)async{
    final url = 'https://samelocationsametaxi.firebaseio.com/requests.json';
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String,dynamic>;
    if(extractedData == null){
      print('null');
      return ;
    }
    print(extractedData);
    extractedData.forEach((userId, userData) {
      double upperstartLocLat = startLocationLat + 0.5;
      double lowerstartLocLat = startLocationLat - 0.5;
      double upperstartLocLong = startLocationLong + 0.5;
      double lowerstartLocLong = startLocationLong - 0.5;
      double upperendLocLat = endLocationLat + 0.5;
      double lowerendLocLat = endLocationLat - 0.5;
      double upperendLocLong = endLocationLong + 0.5;
      double lowerendLocLong = endLocationLong - 0.5;
      if(
        lowerstartLocLat < userData['startLocationLat'] && userData['startLocationLat'] < upperstartLocLat &&
        lowerstartLocLong < userData['startLocationLong'] && userData['startLocationLong'] < upperstartLocLong &&
        lowerendLocLat < userData['endLocationLat'] && userData['endLocationLat'] < upperendLocLat &&
        lowerendLocLong < userData['endLocationLong'] && userData['endLocationLong'] < upperendLocLong &&
        mode == userData['mode'] && alreadyinVehicle == 'No'
      ){
        //connect them
      }
    });
  } 

  Future<void> postRequest(double startLocationLat, double startLocationLong, double endLocationLat, double endLocationLong, String mode, String alreadyinVehicle, DateTime time)async{
    final url = 'https://samelocationsametaxi.firebaseio.com/requests.json';
    try{
      final response = await http.post(
        url,
        body: json.encode({
          'startLocationLat': startLocationLat,
          'endLocationLat': endLocationLat,
          'startLocationLong' : startLocationLong,
          'endLocationLong' : endLocationLong,
          'mode': mode,
          'alreadyinVehicle': alreadyinVehicle,
          'time' : time.toIso8601String(),
        }),
      );
      print(response);
      notifyListeners();
    }catch(error){
      print(error);
    }
  }
}