import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class SaveImage{

  static const String img_key = 'IMAGE_KEY';

  static Future<bool> saveImageToPrefs(String value)async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(img_key, value);
  }

  static Future<String> getImageFromPrefs()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(img_key);
  }

  static String base64String(Uint8List data){
    return base64Encode(data);
  }

  static Image imageFromBase64(String base64String){
    return Image.memory(base64Decode(base64String));
  }
}