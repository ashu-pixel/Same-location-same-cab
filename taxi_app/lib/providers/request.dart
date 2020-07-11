import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_app/screens/copassenger_screen.dart';
import '../models/profilemodel.dart';

class Request with ChangeNotifier{

  List<Map<String,dynamic>> matchedUser = [];
  List<Map<String,dynamic>> matchedRequests = [];

  Future<void> searchPassenger(BuildContext ctx, double startLocationLat, double startLocationLong, double endLocationLat, double endLocationLong, String mode, String alreadyinVehicle, DateTime time,String name, String contactNo, String username)async{
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
      DateTime userTime = DateTime.parse(userData['time']);
      int time2comp = time.hour*60 + time.minute;
      int month2comp = time.month;
      int day2comp = time.day;
      int month = userTime.month;
      int day  = userTime.day;
      int timeC = userTime.hour*60 + userTime.minute;
      int diff = time2comp - timeC;
      if(
        lowerstartLocLat < userData['startLocationLat'] && userData['startLocationLat'] < upperstartLocLat &&
        lowerstartLocLong < userData['startLocationLong'] && userData['startLocationLong'] < upperstartLocLong &&
        lowerendLocLat < userData['endLocationLat'] && userData['endLocationLat'] < upperendLocLat &&
        lowerendLocLong < userData['endLocationLong'] && userData['endLocationLong'] < upperendLocLong &&
        mode == userData['mode'] && (userData['alreadyInVehicle'] == null || userData['alreadyInVehicle'] == 'No') 
        && userData['contactNo']!=contactNo && (month2comp == month) && (day2comp == day) && diff < 10 && diff > -10
      ){
        print(diff);
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

  Future<void> fetchRequests()async{
    matchedRequests = [];
    final url = 'https://samelocationsametaxi.firebaseio.com/requests.json';
    final response =  await http.get(url);
    final extractedData = json.decode(response.body) as Map<String,dynamic>;
    if(extractedData == null){
      print('in null');
      return ;
    }
    String contactNo = Profilee.mydefineduser['contactNo'];
    print(contactNo);
    extractedData.forEach((userID, userData){
      if(contactNo == userData['contactNo']){
        print(userData);
        matchedRequests.add(userData);
      }
    });
    print(matchedRequests);
  }

  dynamic getList(){
    return matchedRequests;
  }
}