import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/loginScreen.dart';
import './screens/welcome_screen.dart';
import './screens/signup_screen.dart';
import './providers/auth.dart';
import './screens/main_screen.dart';
import './providers/users.dart';
import './widgets/profile_firebase.dart';
import './screens/profile.dart';
import './screens/bill_splitter.dart';
import './providers/request.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final token = null;
  final userId = null;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth()
        ),
        ChangeNotifierProvider.value(
          value: Users()
        ),
        ChangeNotifierProvider.value(
          value: Request()
        ),
        ChangeNotifierProvider.value(
          value: Profile()
        )
      ],
      child: Consumer<Auth>(builder: (ctx, auth, _) =>
      MaterialApp(
        title: 'Same Location, Same Taxi',
        theme: ThemeData(
          primaryColor: Color(0xFF6F35A5),
          accentColor: Color(0xFFF1E6FF),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: WelcomeScreen(),
        routes: {
          WelcomeScreen.routeName : (ctx) => WelcomeScreen(),
          LoginScreen.routeName : (ctx) => LoginScreen(),
          SignUpScreen.routeName : (ctx) => SignUpScreen(),
          MainScreen.routeName : (ctx) => MainScreen(),
          ProfileScreen.routeName : (ctx) => ProfileScreen(),
          BillSPlitterScreen.routeName : (ctx) => BillSPlitterScreen(),
          //MainScreen2.routeName : (ctx) => MainScreen2()
          
        },
      )
    )
    );
  }
}
