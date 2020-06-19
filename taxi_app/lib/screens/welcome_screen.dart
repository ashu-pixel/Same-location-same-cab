import 'package:flutter/material.dart';

import './login_screen.dart';
import './signup_screen.dart';

class WelcomeScreen extends StatelessWidget {

  static const routeName = '/welcome';
  
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
            Column(
              children: <Widget>[
                SizedBox(height: size.height*0.15,),
                Text('Welcome', style: TextStyle(fontSize: 40, fontStyle: FontStyle.italic),),
                SizedBox(height: size.height*0.06,),
                Container(
                  width: size.width*0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(LoginScreen.routeName);
                      }, 
                      color: Theme.of(context).primaryColor,
                      child: Text('LOGIN' , style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: size.width*0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(29),
                    child: FlatButton(
                      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(SignUpScreen.routeName);
                      }, 
                      color: Theme.of(context).accentColor,
                      child: Text('SIGNUP' , style: TextStyle(color: Colors.black),),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Image.asset("assets/images/main_bottom.png", width: size.width*0.3,),
            ),

          ],
        )
      )
    );
  }
}