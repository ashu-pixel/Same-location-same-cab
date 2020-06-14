import 'package:flutter/material.dart';

import './signup_screen.dart';
import '../widgets/ui_Container.dart';

class LoginScreen extends StatefulWidget {

  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  void toggleSeen(){
    setState(() {
      _obscureText = !_obscureText;
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
            child: Image.asset("assets/images/main_top.png", width: size.width*0.3,),
          ),
          Column(children: <Widget>[
            SizedBox(height: 150),
            Text('LOGIN', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            SizedBox(height: 30,),
            UiContainer(
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  icon: Icon(Icons.person, color: Theme.of(context).primaryColor,),
                  hintText: 'Username'
                ),
              ),
              Theme.of(context).accentColor,
            ),
            UiContainer(
              TextField(
                obscureText: _obscureText,
                controller: _passwordController,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.lock, 
                    color: Theme.of(context).primaryColor,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.visibility), 
                    color: Theme.of(context).primaryColor,
                    onPressed: toggleSeen,  
                  ),
                  hintText: 'Password',
                ),
              ),
              Theme.of(context).accentColor,
            ),
            UiContainer(
              FlatButton(
                onPressed: () {}, 
                child: Text('Login', style: TextStyle(color: Colors.white),)
              ),
              Theme.of(context).primaryColor,
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
              Text(
                "Don't have an accout ?", 
                style: TextStyle(
                  color: Theme.of(context).primaryColor, 
                ),
              ),
              SizedBox(width: 5,),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(SignUpScreen.routeName);
                },
                child: Text(
                  'Sign Up', 
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
            right: 0,
            child: Image.asset("assets/images/login_bottom.png", width: size.width*0.5),
          )
        ],),
      ),
    );
  }
}