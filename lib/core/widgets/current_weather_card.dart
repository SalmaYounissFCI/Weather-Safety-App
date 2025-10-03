import 'package:flutter/material.dart';
import 'glass_card.dart';

class CurrentWeatherCard extends StatelessWidget {
  const CurrentWeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return GlassmorphismCard(
      width: double.infinity,
      child: Column(
        children: [
          _buildLocationHeader(textTheme, colorScheme),
          const SizedBox(height: 16),
          _buildCurrentWeather(textTheme, colorScheme),
          const SizedBox(height: 16),
          _buildWeatherDetails(textTheme, colorScheme),
        ],
      ),
    );
  }

  Widget _buildLocationHeader(TextTheme textTheme, ColorScheme colorScheme) {
    return Row(
      children: [
        Icon(Icons.location_on_outlined, color: colorScheme.onSurface),
        const SizedBox(width: 8),
        Text(
          "San Francisco, CA",
          style: textTheme.titleLarge?.copyWith(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Icon(Icons.more_vert, color: colorScheme.onSurface),
      ],
    );
  }

  Widget _buildCurrentWeather(TextTheme textTheme, ColorScheme colorScheme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "24°",
              style: textTheme.displayMedium?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Partly Cloudy",
              style: textTheme.headlineSmall?.copyWith(
                color: colorScheme.onSurface.withAlpha(204),
              ),
            ),
          ],
        ),
        GlassmorphismCard(
          width: 100,
          height: 100,
          child: Icon(
            Icons.cloud_outlined,
            size: 60,
            color: colorScheme.onSurface,
          ),
        ),
      ],
    );
  }

  Widget _buildWeatherDetails(TextTheme textTheme, ColorScheme colorScheme) {
    return Row(
      children: [
        Icon(Icons.air, size: 20, color: colorScheme.onSurface),
        const SizedBox(width: 8),
        Text(
          "12 km/h",
          style: textTheme.bodyLarge?.copyWith(color: colorScheme.onSurface),
        ),
        const SizedBox(width: 24),
        Icon(Icons.water_drop_outlined, size: 20, color: colorScheme.onSurface),
        const SizedBox(width: 8),
        Text(
          "68%",
          style: textTheme.bodyLarge?.copyWith(color: colorScheme.onSurface),
        ),
      ],
    );
  }
}
