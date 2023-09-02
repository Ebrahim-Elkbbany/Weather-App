import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

class WeatherService {
  WeatherModel? weatherContent;
  Future<WeatherModel?> getWeather({required String cityName}) async {

      String baseUrl = 'http://api.weatherapi.com/v1';
      String apiKey = 'cc3726a19dfa415781c233313232602';
      Uri url = Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName');
      http.Response response = await http.get(url);
      if (response.statusCode == 400) {
        var data  = jsonDecode(response.body);
        throw Exception(data['error']['message']);
      }
      Map<String, dynamic> data = jsonDecode(response.body);
      weatherContent = WeatherModel.fromJson(data);

    return weatherContent;
  }
}
