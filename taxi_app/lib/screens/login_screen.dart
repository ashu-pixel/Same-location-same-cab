import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './signup_screen.dart';
import '../widgets/ui_Container.dart';
import '../providers/auth.dart';
import '../widgets/http_exception.dart';
import './main_screen.dart';

class LoginScreen extends StatefulWidget {

  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final _passwordfocus = FocusNode();

  @override
  void dispose() {
    _passwordfocus.dispose();
    super.dispose();
  }

  void toggleSeen(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void showErrorDialog(String message) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('An Error Occurred!'),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text('Okay'),
              onPressed: () {
                Navigator.of(ctx).pop();
              },
            )
          ],
        ),
      );
    }

  Future<void> authorize() async{
    final isValid = _formKey.currentState.validate();
    if (!isValid) {
      print('Line 66');
      return;
    }
    _formKey.currentState.save();
    try{
      await Provider.of<Auth>(context, listen:false).login(_usernameController.text, _passwordController.text);
    }on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage = 'Could not authenticate you. Please try again later.';
      showErrorDialog(errorMessage);
    }
    Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
    print(_usernameController.text);
    print(_passwordController.text);
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
            SizedBox(height: size.height*0.15),
            Text('LOGIN', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
            SizedBox(height: size.height*0.03,),
            Form(
              key: _formKey,
              child: Column(children: <Widget>[
              UiContainer(
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person, color: Theme.of(context).primaryColor,),
                    hintText: 'Username'
                  ),
                  onFieldSubmitted: (_) {
                    FocusScope.of(context).requestFocus(_passwordfocus);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Incorrect';
                    }
                    return null;
                  },
                ),
                Theme.of(context).accentColor,
                size.width*0.8,
              ),
              UiContainer(
                TextFormField(
                  obscureText: _obscureText,
                  controller: _passwordController,
                  focusNode: _passwordfocus,
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
                size.width*0.8
              ),
            ])
            ),
            UiContainer(
              FlatButton(
                onPressed: authorize, 
                child: Text('Login', style: TextStyle(color: Colors.white),)
              ),
              Theme.of(context).primaryColor,
              size.width*0.4
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