import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/core/theme/app_colors.dart';
import 'package:weatherapp/core/theme/app_text_styles.dart';
import 'package:weatherapp/views/home/home_screen.dart';
import 'package:weatherapp/views/login/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;
  int currentPage = 0;
  late final List<Map<String, String>> pages;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    pages = [
      {
        "title": "Real-Time Weather Data",
        "subtitle":
            "Get accurate weather information powered by NASA and NOAA satellite data.",
        "animation": "assets/animations/cloud.json",
      },
      {
        "title": "Location-Based Alerts",
        "subtitle":
            "Receive weather warmings\nspecific to your area and stay prepared.",
        "animation": "assets/animations/Location Pin.json",
      },
      {
        "title": "Smart Notifications",
        "subtitle":
            "Personalized alerts based on your activitis and preferences.",
        "animation": "assets/animations/Notification.json",
      },
    ];
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

        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (currentPage > 0)
                      GestureDetector(
                        onTap: () {
                          _controller.previousPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Text(
                          "Back",
                          style: textTheme.titleSmall?.copyWith(
                            color: const Color.fromARGB(255, 115, 115, 115),
                          ),
                        ),
                      )
                    else
                      const SizedBox(width: 50),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Skip",
                        style: textTheme.titleSmall?.copyWith(
                          color: colors.onSurface,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: pages.length,
                  onPageChanged: (index) {
                    setState(() {
                      currentPage = index;
                      isLastPage = index == pages.length - 1;
                    });
                  },
                  itemBuilder: (context, index) {
                    final page = pages[index];
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Lottie.asset(
                              page["animation"]!,
                              height: 220,
                              repeat: true,
                              animate: true,
                            ),
                            const SizedBox(height: 40),
                            Text(
                              page["title"]!,
                              style: TextStyle(
                                color: textTheme.headlineMedium?.color
                                    ?.withOpacity(0.9),
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              page["subtitle"]!,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18,
                                color: textTheme.bodyMedium?.color?.withOpacity(
                                  0.8,
                                ),
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  pages.length,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: currentPage == index ? 20 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: currentPage == index
                          ? Colors.white
                          : Colors.white38,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(
                          255,
                          81,
                          119,
                          152,
                        ).withAlpha(200),
                        blurRadius: 2,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isDarkMode
                          ? AppColorsDark.buttonColor
                          : AppColorsLight.buttonColor,
                      minimumSize: const Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),

                    onPressed: () {
                      if (isLastPage) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      } else {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    child: Text(
                      isLastPage ? "Get Started" : "Next",
                      style: AppTypography.button.copyWith(
                        color: AppColorsDark.textPrimary,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
