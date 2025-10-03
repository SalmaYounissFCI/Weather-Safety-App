import 'package:flutter/material.dart';
import 'package:weatherapp/views/home_screen.dart';
import 'package:weatherapp/views/splash/splash_screen.dart';
import 'core/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final int currentHour = DateTime.now().hour;
    final bool isDayTime = currentHour >= 6 && currentHour < 18;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: isDayTime ? AppTheme.lightTheme : AppTheme.darkTheme,
      home: const HomeScreen(),
    );
  }
}
