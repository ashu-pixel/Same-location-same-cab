import 'dart:io';
import 'package:flutter/material.dart';
import '../models/app_drawer.dart';
import '../models/profilemodel.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {

  static const routeName = '/profile';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  Future<File> imageFile;

  pickImageFromGallery(ImageSource source){
    imageFile = ImagePicker.pickImage(source: source);
  }

  Widget showImage(){
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if(snapshot.connectionState == ConnectionState.done && snapshot!=null){
          return Image.file(snapshot.data);
        }else{
          return Text('No image');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    String email = Profilee.mydefineduser["username"];
    String name = Profilee.mydefineduser['name'];
    String contactNo = Profilee.mydefineduser['contactNo'];
    return Scaffold(
      appBar: AppBar(title: Text('Your Profile'),),
      body: new Stack(
      children: <Widget>[
        ClipPath(
          child: Container(color: Theme.of(context).accentColor),
          clipper: getClipper(),
        ),
        Positioned(
          width: 350.0,
          top: size.height / 5,
          child: Column(
            children: <Widget>[
              Container(
                width: 150.0,
                height: 150.0,
                child: showImage(),
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(75.0)),
                  boxShadow: [
                    BoxShadow(blurRadius: 7.0, color: Colors.black)
                  ]
                )
              ),
              RaisedButton(
                child: Text('Click'),
                onPressed: pickImageFromGallery(ImageSource.gallery),
              ),
              SizedBox(height: 90.0),
              Text(
                name,
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    color: Theme.of(context).primaryColor
                  ),
              ),
              SizedBox(height: 15.0),
              Container(
                height: size.height*0.04,
                width: size.width*0.6,
                child: Material(
                  shadowColor: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(20),
                  elevation: 7.0,
                  color: Theme.of(context).primaryColor,
                  child: GestureDetector(
                    onTap: () {},
                    child: Center(
                      child: Text(
                        email,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15
                        ),
                      ),
                    ),
                  ),
                ) ),
                SizedBox(height: 25.0),
                Container(
                  height: size.height*0.04,
                  width: size.width*0.6,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Theme.of(context).primaryColor,
                    color: Theme.of(context).primaryColor,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {},
                      child: Center(
                        child: Text(
                          contactNo,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                          ),
                        ),
                      ),
                    ),
                  )
                )
              ],
            )
          )
      ],
    ),
    drawer: AppDrawer(),
    );
  }
}

// ignore: camel_case_types
class getClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height / 1.9);
    path.lineTo(size.width + 125, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}