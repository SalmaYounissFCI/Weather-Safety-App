import 'package:flutter/material.dart';
import 'package:weatherapp/core/widgets/current_weather_card.dart';
import 'package:weatherapp/core/widgets/forecast_section.dart';
import 'package:weatherapp/core/widgets/info_card.dart';
import 'package:weatherapp/core/widgets/temperature_trend_card.dart';

class HomeContent extends StatelessWidget {
  const HomeContent();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(height: 16),
              CurrentWeatherCard(),
              SizedBox(height: 24),
              ForecastSection(),
              SizedBox(height: 24),
              InfoCard(
                icon: Icons.invert_colors,
                title: "Rain Expected",
                message:
                    "Heavy rainfall in 2 hours. Carry an umbrella and avoid low-lying areas.",
                color: Colors.red,
              ),
              SizedBox(height: 16),
              InfoCard(
                icon: Icons.wb_sunny_outlined,
                title: "UV Index: Moderate",
                message: "Apply sunscreen if outdoors for extended periods.",
                color: Colors.orange,
              ),
              SizedBox(height: 16),
              InfoCard(
                icon: Icons.waves,
                title: "Stay Hydrated",
                message:
                    "Moderate humidity levels. Drink water regularly throughout the day.",
                color: Colors.green,
              ),
              SizedBox(height: 24),
              TemperatureTrendCard(),
              SizedBox(height: 120),
            ],
          ),
        ),
      ),
    );
  }
}
