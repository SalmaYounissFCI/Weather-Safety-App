import 'package:flutter/material.dart';
import 'package:weatherapp/views/home/home_screen.dart';
import 'package:weatherapp/views/splash/splash_screen.dart';
import 'core/theme/app_theme.dart';
import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
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
      home: const SplashScreen(),
    );
  }
}
