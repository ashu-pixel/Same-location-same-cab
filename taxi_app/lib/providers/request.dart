import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Request with ChangeNotifier{

  Future<void> searchPassenger(BuildContext ctx, double startLocationLat, double startLocationLong, double endLocationLat, double endLocationLong, String mode, String alreadyinVehicle, DateTime time)async{
    final url = 'https://samelocationsametaxi.firebaseio.com/requests.json';
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String,dynamic>;
    if(extractedData == null){
      print('null');
      return ;
    }
    print(extractedData);
    extractedData.forEach((userID, userData) async{
      double upperstartLocLat = startLocationLat + 0.5;
      double lowerstartLocLat = startLocationLat - 0.5;
      double upperstartLocLong = startLocationLong + 0.5;
      double lowerstartLocLong = startLocationLong - 0.5;
      double upperendLocLat = endLocationLat + 0.5;
      double lowerendLocLat = endLocationLat - 0.5;
      double upperendLocLong = endLocationLong + 0.5;
      double lowerendLocLong = endLocationLong - 0.5;
      DateTime uppertimeLimit = time.add(Duration(minutes: 5));
      DateTime lowertimeLimit = time.subtract(Duration(minutes: 5));
      if(
        lowerstartLocLat < userData['startLocationLat'] && userData['startLocationLat'] < upperstartLocLat &&
        lowerstartLocLong < userData['startLocationLong'] && userData['startLocationLong'] < upperstartLocLong &&
        lowerendLocLat < userData['endLocationLat'] && userData['endLocationLat'] < upperendLocLat &&
        lowerendLocLong < userData['endLocationLong'] && userData['endLocationLong'] < upperendLocLong &&
        mode == userData['mode'] && alreadyinVehicle == 'No' && 
        lowertimeLimit.isBefore(DateTime.parse(userData['time'])) && uppertimeLimit.isAfter(DateTime.parse(userData[time]))
      ){
        final userUrl = 'https://samelocationsametaxi.firebaseio.com/users/$userID.json';
        final urlResponse = await http.get(userUrl);
        final matchedUser = json.decode(urlResponse.body) as Map<String,dynamic>;
        if(extractedData == null){
          print('null');
          return ;
        }
        print(matchedUser['name']);
        print(matchedUser['contactNo']);
        showModalBottomSheet(
          context: ctx, 
          builder: (ctx) {
            return Column(children: <Widget>[
              ListTile(
                leading: Icon(Icons.person),
                title: Text(matchedUser['name']),
                subtitle: Text('Name'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                title: Text(matchedUser['contactNo']),
                subtitle: Text('Contact No.'),
              )
            ],);
          }
        );
      }
    });
  } 

  Future<void> postRequest(double startLocationLat, double startLocationLong, double endLocationLat, double endLocationLong, String mode, String alreadyinVehicle, DateTime time, String userId)async{
    final url = 'https://samelocationsametaxi.firebaseio.com/requests/$userId.json';
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

  Future<void> deleteRequest(String userid)async{
    final url = 'https://samelocationsametaxi.firebaseio.com/requests/$userid.json';
    try{
      await http.delete(url);
    }catch(error){
      print(error);
    }
  }

  Future<void> autoDeleteRequest(String userid)async{
    //Delete Request after 30 mins
    final url = 'https://samelocationsametaxi.firebaseio.com/requests/$userid.json';
    try{
      final response = await http.get(url);
      final responseData = json.decode(response.body) as Map<String,dynamic>;
      final DateTime time = responseData['time'];
      final DateTime diff = DateTime.now().subtract(Duration(minutes: 30));
      if(time.isBefore(diff)){
        await http.delete(url);
      }    
    }catch(error){
      print(error);
    }
  }
}