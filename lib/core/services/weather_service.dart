import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

const String openWeatherApiKey = "5653f0a141f166d327170dba37969327";

class WeatherService {
  static Future<CurrentWeather> fetchCurrentWeather(
    double lat,
    double lon,
  ) async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=$openWeatherApiKey',
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return CurrentWeather.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load current weather');
    }
  }

  static Future<ForecastResponse> fetch5DayForecast(
    double lat,
    double lon,
  ) async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&units=metric&appid=$openWeatherApiKey',
    );
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return ForecastResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load forecast data');
    }
  }
}
