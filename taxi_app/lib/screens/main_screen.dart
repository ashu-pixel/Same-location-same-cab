import 'package:flutter/material.dart';
import '../widgets/ui_Container.dart';
import '../widgets/app_drawer.dart';

class MainScreen extends StatelessWidget {

  static const routeName = '/mainScreen';

  @override
  Widget build(BuildContext context) {

    final _locationController = TextEditingController();
    Size size = MediaQuery.of(context).size;

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
                  hintText: 'Select A Location',
                  icon: Icon(Icons.search),
                ),
              ),
              Theme.of(context).accentColor,
              size.width*0.9
            ),
          ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.location_on,),
              label: Text('Current Location'),
              textColor: Theme.of(context).primaryColor,
              onPressed: () {},
            ),
            FlatButton.icon(
              icon: Icon(Icons.map,),
              label: Text('Select on Map'),
              textColor: Theme.of(context).primaryColor,
              onPressed: (){},
            ),
          ],
        ),
        
        ],),
      ),
      drawer: AppDrawer(),
    );
  }
}