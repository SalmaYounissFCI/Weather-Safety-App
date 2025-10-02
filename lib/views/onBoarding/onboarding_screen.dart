import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/core/theme/app_colors.dart';
import 'package:weatherapp/core/theme/app_text_styles.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;
  int currentPage = 0;
  @override
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
    return Scaffold(
      backgroundColor: AppColorsDark.background,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 66, 84, 134),
              Color.fromARGB(255, 31, 44, 80),
              AppColorsDark.gradientEnd,
            ],
            stops: [0, 0.4, 1],
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
                        child: const Text(
                          "Back",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white54,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    else
                      const SizedBox(width: 50),
                    GestureDetector(
                      onTap: () {
                        // Navigator.pushReplacementNamed(context, "/login");
                      },
                      child: const Text(
                        "skip",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColorsDark.primary,
                          fontWeight: FontWeight.w600,
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
                              style: const TextStyle(
                                color: AppColorsDark.textSecondary,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              page["subtitle"]!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                color: AppColorsDark.textSecondary,
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
                          86,
                          126,
                          197,
                        ).withOpacity(0.7), // لون اللمعة
                        blurRadius: 2, // كل ما زاد زادت الهالة
                        spreadRadius: 5, // مدى انتشار الضوء
                      ),
                    ],
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 66, 84, 134),
                      minimumSize: const Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      if (isLastPage) {
                        // Navigator.pushReplacementNamed(context, "/login");
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
