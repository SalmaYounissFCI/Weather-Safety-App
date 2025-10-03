import 'package:flutter/material.dart';
import 'glass_card.dart';

class ForecastCard extends StatelessWidget {
  final String day;
  final IconData icon;
  final String temp;

  const ForecastCard({
    super.key,
    required this.day,
    required this.icon,
    required this.temp,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GlassmorphismCard(
        width: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day,
              style: TextStyle(color: colorScheme.onSurface.withAlpha(204)),
            ),
            const SizedBox(height: 8),
            Icon(icon, color: colorScheme.onSurface, size: 32),
            const SizedBox(height: 8),
            Text(
              temp,
              style: TextStyle(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
