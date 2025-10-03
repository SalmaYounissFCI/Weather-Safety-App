import 'package:flutter/material.dart';
import 'dart:ui';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor = isDarkMode
        ? Colors.black.withAlpha(77)
        : Colors.white.withAlpha(102);
    final borderColor = isDarkMode
        ? Colors.white.withAlpha(51)
        : Colors.white.withAlpha(128);

    return ClipRRect(
      borderRadius: BorderRadius.circular(25.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(25.0),
            border: Border.all(color: borderColor, width: 1.0),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, "Home", true, colorScheme),
              _buildNavItem(
                Icons.notifications_outlined,
                "Alerts",
                false,
                colorScheme,
              ),
              _buildNavItem(Icons.map_outlined, "Map", false, colorScheme),
              _buildNavItem(
                Icons.person_outline,
                "Profile",
                false,
                colorScheme,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    bool isActive,
    ColorScheme colorScheme,
  ) {
    // Active item style
    const activeColor = Colors.white;
    const activeBackgroundColor = Color(0xFF38B6FF);

    // Inactive item style
    final inactiveColor = colorScheme.onSurface.withAlpha(204);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? activeBackgroundColor : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: isActive ? activeColor : inactiveColor),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: isActive ? activeColor : inactiveColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
