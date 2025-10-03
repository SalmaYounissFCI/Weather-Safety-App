import 'package:flutter/material.dart';
import 'package:weatherapp/profile_screen.dart';
import 'package:weatherapp/views/home/home_content.dart';
import '../../core/theme/app_colors.dart';
import '../../alerts_screen.dart';
import '../../core/widgets/bottom_navigation_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = const [
    HomeContent(), // محتوى الهوم زي ما هو
    AlertsScreen(),
    Center(child: Text("Map Screen", style: TextStyle(fontSize: 20))),
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
        body: IndexedStack(index: _selectedIndex, children: _screens),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BottomNavBar(
            currentIndex: _selectedIndex,
            onTabSelected: _onTabSelected,
          ),
        ),
      ),
    );
  }
}
