import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/core/theme/app_colors.dart';
import 'package:weatherapp/core/theme/app_text_styles.dart';
import 'package:weatherapp/views/onBoarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;
  bool _moveIcons = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _opacity = 1.0;
        _moveIcons = true;
      });
    });

    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;

    final isDarkMode = theme.brightness == Brightness.dark;
    final gradientStartColor = isDarkMode
        ? AppColorsDark.gradientStart
        : AppColorsLight.gradientStart;
    final gradientEndColor = isDarkMode
        ? AppColorsDark.gradientEnd
        : AppColorsLight.gradientEnd;
    return Scaffold(
      backgroundColor: AppColorsDark.background,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [gradientStartColor, gradientEndColor],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Stack(
          children: [
            //
            AnimatedPositioned(
              duration: const Duration(seconds: 3),
              top: _moveIcons ? 60 : 80,
              left: 40,
              child: const Icon(
                Icons.cloud,
                color: AppColorsDark.textMuted,
                size: 40,
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(seconds: 3),
              top: _moveIcons ? 200 : 220,
              right: 40,
              child: const Icon(
                Icons.cloud_queue,
                color: AppColorsDark.textMuted,
                size: 35,
              ),
            ),
            AnimatedPositioned(
              duration: const Duration(seconds: 3),
              bottom: _moveIcons ? 50 : 70,
              right: 100,
              child: const Icon(
                Icons.wb_sunny,
                color: AppColorsDark.accentBlue,
                size: 45,
              ),
            ),

            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    "assets/animations/cloud.json",
                    height: 150,
                    width: 150,
                  ),
                  const SizedBox(height: 20),

                  AnimatedOpacity(
                    duration: const Duration(seconds: 2),
                    opacity: _opacity,
                    child: Column(
                      children: [
                        Text(
                          "WeatherSafe",
                          style: AppTypography.h1.copyWith(
                            color: textTheme.bodyLarge?.color,
                          ),
                        ),

                        SizedBox(height: 10),
                        Text(
                          "Your Personal Weather Guardian",
                          style: TextStyle(
                            fontSize: 18,
                            color: textTheme.bodyMedium?.color?.withOpacity(
                              0.8,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
