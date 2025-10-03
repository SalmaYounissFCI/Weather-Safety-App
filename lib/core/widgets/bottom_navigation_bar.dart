import 'package:flutter/material.dart';
import 'glass_card.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return GlassmorphismCard(
      width: double.infinity,
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
          _buildNavItem(Icons.person_outline, "Profile", false, colorScheme),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    IconData icon,
    String label,
    bool isActive,
    ColorScheme colorScheme,
  ) {
    final color = isActive
        ? colorScheme.onSurface
        : colorScheme.onSurface.withAlpha(150);
    return GlassmorphismCard(
      isPadded: false,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive
              ? colorScheme.surface.withAlpha(100)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color),
            const SizedBox(height: 4),
            Text(label, style: TextStyle(color: color, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
