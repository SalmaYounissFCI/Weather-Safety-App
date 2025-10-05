import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../models/info_card_model.dart';

class SmartInfoService {
  static List<InfoCardModel> generateInfoCards({
    required CurrentWeather currentData,
    required ForecastResponse forecastData,
  }) {
    final List<InfoCardModel> cards = [];

    debugPrint("--- Smart Info Service ---");
    debugPrint("Current Temp: ${currentData.main.temp}");
    debugPrint("Current Humidity: ${currentData.main.humidity}");

    if (forecastData.list.isNotEmpty) {
      final nextForecast = forecastData.list.first;
      final weatherCondition = nextForecast.weather.description.toLowerCase();
      debugPrint("Next Forecast Condition: $weatherCondition");

      if (weatherCondition.contains('rain') ||
          weatherCondition.contains('thunderstorm')) {
        cards.add(
          InfoCardModel(
            title: "Rain Expected",
            message:
                "Rain is expected within the next hours. Carry an umbrella.",
            icon: Icons.invert_colors,
            color: Colors.red,
          ),
        );
      }
    }

    if (currentData.main.temp > 30 || currentData.main.humidity > 60) {
      cards.add(
        InfoCardModel(
          title: "Stay Hydrated",
          message: "High temperature or humidity. Drink water regularly.",
          icon: Icons.waves,
          color: Colors.green,
        ),
      );
    }

    debugPrint("Generated ${cards.length} info cards.");
    debugPrint("--------------------------");

    if (cards.isEmpty) {
      cards.add(
        InfoCardModel(
          title: "All Clear!",
          message: "No special weather alerts for now. Enjoy your day!",
          icon: Icons.check_circle_outline,
          color: Colors.blue,
        ),
      );
    }

    return cards;
  }
}
