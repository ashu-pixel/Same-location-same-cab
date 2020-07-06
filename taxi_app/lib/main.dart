import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/loginScreen.dart';
import './screens/welcome_screen.dart';
import './screens/signup_screen.dart';
import './screens/main_screen.dart';
import './providers/users.dart';
import './screens/profile.dart';
import './screens/bill_splitter.dart';
import './providers/request.dart';
import './providers/auth.dart';
import './screens/taxi_rates_screens.dart';
import './screens/rickshaw_rates_screen.dart';
import './screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Users()
        ),
        ChangeNotifierProvider.value(
          value: Request()
        ),
        ChangeNotifierProvider.value(
          value: Auth()
        )
      ],
      child: Consumer<Auth>(builder: (ctx, auth, _) => MaterialApp(
        title: 'Same Location, Same Taxi',
        theme: ThemeData(
          primaryColor: Color(0xFF6F35A5),
          accentColor: Color(0xFFF1E6FF),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: auth.isAuth ? MainScreen() 
        : FutureBuilder(future: auth.tryAutoLogin(), builder: (ctx, authResultSnapshot) => 
          authResultSnapshot.connectionState == ConnectionState.waiting 
          ? SplashScreen() 
          : WelcomeScreen(),),
        routes: {
          WelcomeScreen.routeName : (ctx) => WelcomeScreen(),
          LoginScreen.routeName : (ctx) => LoginScreen(),
          SplashScreen.routeName : (ctx) => SplashScreen(),
          SignUpScreen.routeName : (ctx) => SignUpScreen(),
          MainScreen.routeName : (ctx) => MainScreen(),
          ProfileScreen.routeName : (ctx) => ProfileScreen(),
          BillSPlitterScreen.routeName : (ctx) => BillSPlitterScreen(),
          TaxiRatesScreen.routeName : (ctx) => TaxiRatesScreen(),
          RickshawRatesScreen.routeName : (ctx) => RickshawRatesScreen(),
        },
      )
      )
    );
  }
}
