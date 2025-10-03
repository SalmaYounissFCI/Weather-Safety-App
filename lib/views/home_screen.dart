import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/widgets/bottom_navigation_bar.dart';
import '../core/widgets/current_weather_card.dart';
import '../core/widgets/forecast_section.dart';
import '../core/widgets/info_card.dart';
import '../core/widgets/temperature_trend_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final gradientStartColor = isDarkMode
        ? AppColorsDark.gradientStart
        : AppColorsLight.gradientStart;
    final gradientEndColor = isDarkMode
        ? AppColorsDark.gradientEnd
        : AppColorsLight.gradientEnd;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [gradientStartColor, gradientEndColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        message:
                            "Apply sunscreen if outdoors for extended periods.",
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: BottomNavBar(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
