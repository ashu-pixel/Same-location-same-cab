import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../providers/request.dart';
import '../widgets/ui_Container.dart';
import '../models/app_drawer.dart';
import '../widgets/location_input.dart';
import '../models/place_location.dart';
import '../models/profilemodel.dart';

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
  String staddress;
  String endaddress;
  List<String> getType = ['Taxi', 'Rickshaw'];
  String selectedtype;
  String selectedResponse;
  String selectedTime;
  String selectedreply;
  List<String> getResponse = ['Yes', 'No'];
  List<String> getTime = ['5 min','10 min','15 min','20 min','25 min','30 min'];

  List<DropdownMenuItem<String>> buildDropDownMenuItems(List types){
    List<DropdownMenuItem<String>> items = List();
    for(String type in types){
      items.add(
        DropdownMenuItem(
          value: type, 
          child: Text(type, style: TextStyle(color: Theme.of(context).primaryColor),)
        )
      );
    } 
    return items;
  }

  int _groupValue = -1;
  Widget _myRadioButton({String title, int value, Function onChanged}) {
  return RadioListTile(
    activeColor: Theme.of(context).primaryColor,
    value: value,
    groupValue: _groupValue,
    onChanged: onChanged,
    title: Text(title),
  );
  }


  String getStartAddress(double latitude, double longitude){
   convertToStartAddress(latitude, longitude).then((value) {
     //print("hi======================================");
     //print(staddress);
     return staddress;
   });
   return staddress;
  }

  String getEndAddress(double latitude, double longitude){
    convertToEndAddress(latitude, longitude).then((value) {
      //print(endaddress);
      return endaddress;
   });
   return endaddress;
  }

  Future<void>convertToEndAddress(double latitude, double longitude)async{
    //print("coming here");

    final coordinates = new Coordinates(latitude, longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print(first);
    endaddress=first.addressLine.toString();
    print(first.addressLine.runtimeType);
    //print("=======================");
    //print(first.toString());
    return first.addressLine;
  }

  Future<void>convertToStartAddress(double latitude, double longitude)async{
    //print("coming here");

    final coordinates = new Coordinates(latitude, longitude);
    var addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print(first);
    staddress=first.addressLine.toString();
    print(first.addressLine.runtimeType);
    //print("=======================");
    //print(first.toString());
    return first.addressLine;
  }

  Future<void> _launchNav(double startLat, double startLong, double endLat, double endLong) async {
    String api = 'https://www.google.com/maps/dir/?api=1&origin=($startLat,$startLong)&destination=($endLat,$endLong)&travelmode=drive';
    if (await canLaunch(api)) {
      await launch(api);
    } else {
      throw 'Could not launch $api';
    }
  }
  String email;

  dynamic showErrorDialog(String message) {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(
          'An Error Occurred!',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold
          ),
        ),
        content: Text(
          message,
          style: TextStyle(
            color: Theme.of(context).primaryColor
          ),
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              'Okay',
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  @override
  void initState(){
    if(_pickedStartLocation != null){
      String stAdd =  getStartAddress(_pickedStartLocation.latitude, _pickedStartLocation.longitude);
      setState(() {
        _locationStartController.text = stAdd;
      });
    }
    if(_pickedEndLocation != null){
      String endAdd =  getEndAddress(_pickedEndLocation.latitude, _pickedEndLocation.longitude);
      setState(() {
        _locationEndController.text = endAdd;
      });
    }
    super.initState();
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
                  icon: Icon(Icons.search, color: Theme.of(context).primaryColor),
                  focusColor: Theme.of(context).primaryColor,
                  labelText: _pickedStartLocation!=null ? getStartAddress(_pickedStartLocation.latitude, _pickedStartLocation.longitude).toString() : "Select a Start Location",
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
                  icon: Icon(Icons.search, color: Theme.of(context).primaryColor,),
                  focusColor: Theme.of(context).primaryColor,
                  labelText: _pickedEndLocation!=null ? getEndAddress(_pickedEndLocation.latitude, _pickedEndLocation.longitude).toString() : "Select an End Location",
                ),
              ),
              Theme.of(context).accentColor,
              size.width*0.9
            ),
          ),
          LocationInputEnd(_selectEndPlace),
          SizedBox(height: size.height*0.01,),
          Container(
            alignment: Alignment.center,
            child: UiContainer(
              FlatButton(
                child: Text('Show Locations on map', style: TextStyle(color: Colors.white),),
                onPressed: ()async{
                  if(_pickedStartLocation == null || _pickedEndLocation == null){
                    showErrorDialog('Start Location and Destination should be selected');
                    return;
                  }
                  _launchNav(
                    _pickedStartLocation.latitude, 
                    _pickedStartLocation.longitude, 
                    _pickedEndLocation.latitude, 
                    _pickedEndLocation.longitude,
                  );
                },
              ),
              Theme.of(context).primaryColor,
              size.width*0.6
            )
          ),
          Container(
          alignment: Alignment.center,
          child: UiContainer(
            Column(
              children: <Widget>[
                Text(
                  'Select A Mode',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontStyle: FontStyle.italic
                  ),
                ),
                DropdownButton(
                  value: selectedtype,
                  items: buildDropDownMenuItems(getType),
                  onChanged: (String val){
                    setState(() {
                      selectedtype = val;
                    });
                  },
                ),
              ],
            ),
            Theme.of(context).accentColor,
            size.width*0.8
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: UiContainer(
            Column(children: <Widget>[
              Text(
                'Do you want to Ride Now',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontStyle: FontStyle.italic
                ),
              ),
              _myRadioButton(
                title: "Yes",
                value: 0,
                onChanged: (newValue) => setState((){ 
                  _groupValue = newValue;
                  selectedreply = "Yes";
                }
                ),
              ),
              _myRadioButton(
                title: "No",
                value: 1,
                onChanged: (newValue) => setState(
                  (){
                    _groupValue = newValue;
                    selectedreply = "No";
                  }
                ),
              ),
            ],),
            Theme.of(context).accentColor,
            size.width*0.8
          ),
        ),
        AnimatedContainer(
          constraints: BoxConstraints(
            minHeight: selectedreply== 'Yes' ? 60 : 0,
            maxHeight: selectedreply == 'Yes' ? 120 : 0,
          ),
          alignment: Alignment.center,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
          child: UiContainer(
            Column(
              children: <Widget>[
                Text(
                  'Are you already in the vehicle?',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontStyle: FontStyle.italic
                  ),
                ),
                DropdownButton(
                  value: selectedResponse,
                  items: buildDropDownMenuItems(getResponse),
                  onChanged: (String value){
                    setState(() {
                      selectedResponse = value;
                    });
                  },
                ),
              ],
            ),
            Theme.of(context).accentColor,
            size.width*0.8
          ),
        ),
        AnimatedContainer(
          constraints: BoxConstraints(
            minHeight: selectedreply == 'No' ? 60 : 0,
            maxHeight: selectedreply == 'No' ? 120 : 0,
          ),
          alignment: Alignment.center,
          duration: Duration(milliseconds: 400),
          curve: Curves.easeIn,
          child: Container(
            height: 200,
            child: UiContainer(
              Column(
                children: <Widget>[
                  Text(
                    'Select a Time-Slot',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      fontStyle: FontStyle.italic
                    ),
                  ),
                  DropdownButton(
                    value: selectedTime,
                    items: buildDropDownMenuItems(getTime),
                    onChanged: (String value){
                      setState(() {
                        selectedTime = value;
                      });
                    },
                  ),
                ],
              ),
              Theme.of(context).accentColor,
              size.width*0.8
            ),
          ),
        ),
        UiContainer(
        FlatButton(
          child: Text('Search for a Co-Passenger', style: TextStyle(color: Colors.white),),
          onPressed: (){
            print('--------------');
            if(_pickedStartLocation == null || _pickedEndLocation == null || selectedtype == null || selectedreply == null || (selectedResponse == null && selectedTime == null)){
              showErrorDialog('All Fields are mandatory');
              return;
            }
            print('===================================');
            int time;
            double stlat = _pickedStartLocation.latitude;
            double stlon = _pickedStartLocation.longitude;
            double endlat = _pickedEndLocation.latitude;
            double endlong = _pickedEndLocation.longitude;
            String username = Profilee.mydefineduser['username'];
            String name = Profilee.mydefineduser['name'];
            String contactNo = Profilee.mydefineduser['contactNo'];
            if(selectedTime == '5 min'){
              print('5 min');
              time = 5;
            }else if(selectedTime == '10 min'){
              time = 10;
              print('10');
            }else if(selectedTime == '15 min'){
              time = 15;
              print('15');
            }else if(selectedTime == '20 min'){
              time = 20;
              print('20');
            }else if(selectedTime == '25 min'){
              time = 25;
              print('25');
            }else if(selectedTime == '30 min'){
              time = 30;
              print('30');
            }
            DateTime finalTime = DateTime.now();
            if(time != null){
              finalTime = DateTime.now().add(Duration(minutes: time));
              print(finalTime);
              print(selectedResponse);
            }else{
              finalTime = DateTime.now();
              print(selectedResponse);
            }
            print('===================================');
            print("username");
            Provider.of<Request>(context, listen:false).searchPassenger(context, stlat, stlon, endlat, endlong, selectedtype, selectedResponse, finalTime,name,contactNo,username);
            //Provider.of<Request>(context, listen: false).postRequest(stlat,stlon,endlat,endlong,selectedtype,selectedResponse,DateTime.now(),name,contactNo);
          },
        ),
        Theme.of(context).primaryColor,
        size.width*0.8
        ),
        SizedBox(height: size.height*0.04)
        ],),
      ),
      drawer: AppDrawer(),
    );
  }
}