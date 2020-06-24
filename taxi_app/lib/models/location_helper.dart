import 'dart:convert';

import 'package:http/http.dart' as http;

const GOOGLE_API_KEY = 'AIzaSyCv28h21FDtPg6PLCF9s_GpFjxyuChQTt8';

class LocationHelper { 
  static String generateLocationPreviewImage({double latitude, double longitude,}) {
    print(latitude);
    print(longitude);
    String url = 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=16&size=400x400&markers=color:red%7Clabel:S%7C11211%7C11206%7C11222&key=$GOOGLE_API_KEY';
    return url;
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_API_KEY';
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}