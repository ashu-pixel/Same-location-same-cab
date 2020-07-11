import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:taxi_app/models/app_drawer.dart';
import 'package:taxi_app/providers/request.dart';
import 'package:taxi_app/widgets/ui_Container.dart';
import'../models/profilemodel.dart';

class RideRequests extends StatelessWidget {

  static const routeName = '/ride-request';
  final name = Profilee.mydefineduser['name'];
  
  @override
  Widget build(BuildContext context) {

    List<Map<String,dynamic>> matchedReqs = [];
    matchedReqs = Provider.of<Request>(context, listen: false).getList();

    dynamic showModalSheet(Map<String,dynamic> request){
      Size size = MediaQuery.of(context).size;
      print(request);
      DateTime time = DateTime.parse(request['time']);
      print(time.toString());
      showModalBottomSheet(context: context, builder: (ctx){
        return Container(
          child: Column(children: <Widget>[
            UiContainer(
              Column(children: <Widget>[
                Text('Start Location :', style: TextStyle(color: Theme.of(context).primaryColor),),
                SizedBox(height: size.height*0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                  Text(request['startLocationLat'].toStringAsFixed(4), style: TextStyle(color: Theme.of(context).primaryColor),),
                  Text(request['startLocationLong'].toStringAsFixed(4), style: TextStyle(color: Theme.of(context).primaryColor),)
                ],)
              ],),
              Theme.of(context).accentColor,
              size.width*0.95
            ),
            UiContainer(
              Column(children: <Widget>[
                Text('End Location :',style: TextStyle(color: Theme.of(context).primaryColor),),
                SizedBox(height: size.height*0.01,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                  Text(request['endLocationLat'].toStringAsFixed(4),style: TextStyle(color: Theme.of(context).primaryColor),),
                  Text(request['endLocationLong'].toStringAsFixed(4),style: TextStyle(color: Theme.of(context).primaryColor))
                ],)
              ],),
              Theme.of(context).accentColor,
              size.width*0.95
            ),
            UiContainer(
              Column(children: <Widget>[
                Text('Mode of Transport',style: TextStyle(color: Theme.of(context).primaryColor)),
                SizedBox(height: size.height*0.01,),
                Text(request['mode'],style: TextStyle(color: Theme.of(context).primaryColor))
              ],),
              Theme.of(context).accentColor,
              size.width*0.95
            ),
          ],),
        );
      });
    }

    return Scaffold(
      appBar: AppBar(title: Text('Your Ride Requests'),),
      body: ListView.builder(
        itemCount: matchedReqs.length,
        itemBuilder: (ctx,i){
          return Card(
            elevation: 5,
            child: ListTile(
              title: Text(matchedReqs[i]['time'],style: TextStyle(color: Theme.of(context).primaryColor)),
              subtitle: Text(matchedReqs[i]['mode'],style: TextStyle(color: Theme.of(context).primaryColor)),
              trailing: IconButton(
                icon : Icon(Icons.arrow_drop_down),
                onPressed: (){
                  showModalSheet(matchedReqs[i]);
                },
              )
            ),
          );
        },
      ),
      // body: RaisedButton(
      //   child: Text('Click'),
      //   onPressed: (){
      //     print(matchedReqs);
      //   },
      // ),
      drawer: AppDrawer(),
    );
  }
}

