import 'package:flutter/cupertino.dart';
import './user.dart';

class Users with ChangeNotifier{
  List<User> _users = [];

  Users(this._users);

  
}