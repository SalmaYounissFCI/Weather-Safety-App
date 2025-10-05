import 'package:flutter/material.dart';
import 'package:weatherapp/profilePage/profile_screen.dart';
import 'package:weatherapp/views/home/home_content.dart';
import '../../core/theme/app_colors.dart';
import '../../alerts_screen.dart';
import '../../core/widgets/bottom_navigation_bar.dart';
import '../Map/map_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeContent(),
    AlertsScreen(),
    MapScreen(),
    ProfileScreen(),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            IndexedStack(index: _selectedIndex, children: _screens),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                child: BottomNavBar(
                  currentIndex: _selectedIndex,
                  onTabSelected: _onTabSelected,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
