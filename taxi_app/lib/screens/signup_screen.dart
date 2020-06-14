import 'package:flutter/material.dart';

import './login_screen.dart';
import '../widgets/ui_Container.dart';

class SignUpScreen extends StatefulWidget {

  static const routeName = '/signup';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool _obscureText = true;
  bool _obscureText1 = true;

  void _toggleSeen(){
    setState(() {
      _obscureText = !_obscureText;
    });   
  }

  void _toggleSeen1(){
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

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
            UiContainer(
              TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.person, color: Theme.of(context).primaryColor,),
                  hintText: 'Username'),
              ),
              Theme.of(context).accentColor,
            ),
            UiContainer(
              TextField(
                obscureText: _obscureText,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock, color: Theme.of(context).primaryColor,),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility), 
                    color: Theme.of(context).primaryColor,
                    onPressed: _toggleSeen,
                  ),
                  hintText: 'Password',
                ),
              ),
              Theme.of(context).accentColor,
            ),
            UiContainer(
              TextField(
                obscureText: _obscureText1,
                decoration: InputDecoration(
                  icon: Icon(Icons.lock, color: Theme.of(context).primaryColor,),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility), 
                    color: Theme.of(context).primaryColor,
                    onPressed: _toggleSeen1,  
                  ),
                  hintText: 'Confirm Password',
                ),
              ),
              Theme.of(context).accentColor,
            ),
            UiContainer(
              FlatButton(
                onPressed: () {}, 
                child: Text('Sign Up', style: TextStyle(color: Colors.white),)
              ),
              Theme.of(context).primaryColor,
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