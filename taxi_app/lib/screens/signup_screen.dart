import 'package:flutter/material.dart';

import './login_screen.dart';

class SignUpScreen extends StatelessWidget {

  static const routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset("assets/images/signup_top.png", width: size.width*0.3,),
          ),
          Column(children: <Widget>[
            SizedBox(height: 150),
            Text('SIGN UP', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.symmetric(horizontal:20, vertical:5),
              margin: EdgeInsets.symmetric(vertical:10),
              width: size.width*0.8,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(29)
              ),
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person, color: Theme.of(context).primaryColor,),
                  hintText: 'Username'),
              )
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal:20, vertical:5),
              margin: EdgeInsets.symmetric(vertical:10),
              width: size.width*0.8,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(29)
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock, color: Theme.of(context).primaryColor,),
                  suffixIcon: Icon(Icons.visibility, color: Theme.of(context).primaryColor,),
                  hintText: 'Password',
                ),
              )
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal:20, vertical:5),
              margin: EdgeInsets.symmetric(vertical:10),
              width: size.width*0.8,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(29)
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock, color: Theme.of(context).primaryColor,),
                  suffixIcon: Icon(Icons.visibility, color: Theme.of(context).primaryColor,),
                  hintText: 'Confirm Password',
                ),
              )
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal:20, vertical:5),
              margin: EdgeInsets.symmetric(vertical:10),
              width: size.width*0.8,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(29)
              ),
              child: FlatButton(
                onPressed: () {}, 
                child: Text('Sign Up', style: TextStyle(color: Colors.white),)
              ),
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text(
                "Already have an accout ?", 
                style: TextStyle(
                  color: Theme.of(context).primaryColor, 
                ),
              ),
              SizedBox(width: 5,),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(LoginScreen.routeName);
                },
                child: Text(
                  'Login', 
                  style: TextStyle(
                    color: Theme.of(context).primaryColor, 
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
            ],)
          ],),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset("assets/images/main_bottom.png", width: size.width*0.3),
          )
        ],),
      ),
    );
  }
}