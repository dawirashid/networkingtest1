import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:networkingtest1/model.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async {
    final queryParameters = {
      'q': city,
      'appid': 'f4b9958ef972f6b4ce9460c32ba46d92',
      'units': 'metric'
    };

    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    print(response.body);
    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);
  }
}

// appid = "f4b9958ef972f6b4ce9460c32ba46d92";
