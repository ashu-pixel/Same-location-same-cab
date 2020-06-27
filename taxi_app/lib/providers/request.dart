import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:taxi_app/providers/user.dart';

class Request with ChangeNotifier{

  Future<void> searchPassenger(BuildContext ctx, double startLocationLat, double startLocationLong, double endLocationLat, double endLocationLong, String mode, String alreadyinVehicle, DateTime time)async{
    final url = 'https://samelocationsametaxi.firebaseio.com/requests.json';
    print('in search fxn');
    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String,dynamic>;
    if(extractedData == null){
      print('in null');
      return ;
    }
    print('============================================');
    print(extractedData);
    extractedData.forEach((userID, userData){
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

        print(userData);
        // final userUrl = 'https://samelocationsametaxi.firebaseio.com/users.json';
        // final urlResponse = await http.get(userUrl);
        // final extractedUsers = json.decode(urlResponse.body) as Map<String,dynamic>;
        // print(extractedUsers);
        // if(extractedUsers == null){
        //   print('null');
        //   return ;
        // }
        // extractedUsers.forEach((userid, user) {
        //   if(userData['email'] == user['email']){
        //     final matchedUser = user;
        //     print(matchedUser['name']);
        //     print(matchedUser['contactNo']);
        //   }
        // });
        // showModalBottomSheet(
        //   context: ctx, 
        //   builder: (ctx) {
        //     return Column(children: <Widget>[
        //       ListTile(
        //         leading: Icon(Icons.person),
        //         title: Text(matchedUser['name']),
        //         subtitle: Text('Name'),
        //       ),
        //       ListTile(
        //         leading: Icon(Icons.phone),
        //         title: Text(matchedUser['contactNo']),
        //         subtitle: Text('Contact No.'),
        //       )
        //     ],);
        //   }
        // );
      }
      print('No Data');
    });
  } 

  Future<void> postRequest(double startLocationLat, double startLocationLong, double endLocationLat, double endLocationLong, String mode, String alreadyinVehicle, DateTime time, String email)async{
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
          'email' : email,
        }),
      );
      print(response);
      notifyListeners();
    }catch(error){
      print(error);
    }
  }

  // Future<void> deleteRequest(String userid)async{
  //   final url = 'https://samelocationsametaxi.firebaseio.com/requests/$userid.json';
  //   try{
  //     await http.delete(url);
  //   }catch(error){
  //     print(error);
  //   }
  // }
}