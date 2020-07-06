import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_app/screens/copassenger_screen.dart';

class Request with ChangeNotifier{

  List<Map<String,dynamic>> matchedUser = [];

  Future<void> searchPassenger(BuildContext ctx, double startLocationLat, double startLocationLong, double endLocationLat, double endLocationLong, String mode, String alreadyinVehicle, DateTime time,String name, String contactNo)async{
    final url = 'https://samelocationsametaxi.firebaseio.com/requests.json';
    print('in search fxn');
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String,dynamic>;
    if(extractedData == null){
      print('in null');
      return ;
    }
    print(extractedData);
    extractedData.forEach((userID, userData){
      double upperstartLocLat = startLocationLat + 0.03;
      double lowerstartLocLat = startLocationLat - 0.03;
      double upperstartLocLong = startLocationLong + 0.03;
      double lowerstartLocLong = startLocationLong - 0.03;
      double upperendLocLat = endLocationLat + 0.03;
      double lowerendLocLat = endLocationLat - 0.03;
      double upperendLocLong = endLocationLong + 0.03;
      double lowerendLocLong = endLocationLong - 0.03;
      DateTime uppertimeLimit = time.add(Duration(minutes: 10));
      DateTime lowertimeLimit = time.subtract(Duration(minutes: 10));
      if(
        lowerstartLocLat < userData['startLocationLat'] && userData['startLocationLat'] < upperstartLocLat &&
        lowerstartLocLong < userData['startLocationLong'] && userData['startLocationLong'] < upperstartLocLong &&
        lowerendLocLat < userData['endLocationLat'] && userData['endLocationLat'] < upperendLocLat &&
        lowerendLocLong < userData['endLocationLong'] && userData['endLocationLong'] < upperendLocLong &&
        mode == userData['mode'] &&
        lowertimeLimit.isBefore(DateTime.parse(userData['time'])) && uppertimeLimit.isAfter(DateTime.parse(userData[time]))
        && userData['contactNo']!=contactNo
      ){
        print(userData['name']);
        matchedUser.add(userData);
        print(matchedUser);
      }else{
      print('No Data');
      }
      Navigator.of(ctx).pushReplacement(MaterialPageRoute(
        builder: (ctx) => CoPassenger(matchedUser,startLocationLat,startLocationLong, endLocationLat, endLocationLong, mode,alreadyinVehicle,time,name,contactNo),
      ));
      },
    );
  } 

  Future<void> postRequest(double startLocationLat, double startLocationLong, double endLocationLat, double endLocationLong, String mode, String alreadyinVehicle, DateTime time, String name, String contactNo)async{
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
          'name' : name,
          'contactNo' : contactNo,
        }),
      );
      print(response);
      notifyListeners();
    }catch(error){
      print(error);
    }
  }
}