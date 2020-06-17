import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/login_screen.dart';
import './screens/welcome_screen.dart';
import './screens/signup_screen.dart';
import './providers/auth.dart';
import './screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth()
        ),
      ],
      child: Consumer<Auth>(builder: (ctx, auth, _) =>
      MaterialApp(
        title: 'Same Location, Same Taxi',
        theme: ThemeData(
          primaryColor: Color(0xFF6F35A5),
          accentColor: Color(0xFFF1E6FF),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: auth.isAuth ? MainScreen() : WelcomeScreen(),
        routes: {
          WelcomeScreen.routeName : (ctx) => WelcomeScreen(),
          LoginScreen.routeName : (ctx) => LoginScreen(),
          SignUpScreen.routeName : (ctx) => SignUpScreen(),
          MainScreen.routeName : (ctx) => MainScreen(),
        },
      )
      ,)
      
    );
  }
}
