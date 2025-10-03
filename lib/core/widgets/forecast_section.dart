import 'package:flutter/material.dart';

import 'forecast_card.dart';

class ForecastSection extends StatelessWidget {
  const ForecastSection({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "7-Day Forecast",
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 120,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              ForecastCard(
                day: "Mon",
                icon: Icons.wb_sunny_outlined,
                temp: "24°",
              ),
              ForecastCard(day: "Tue", icon: Icons.cloud_outlined, temp: "22°"),
              ForecastCard(day: "Wed", icon: Icons.grain_outlined, temp: "19°"),
              ForecastCard(
                day: "Thu",
                icon: Icons.thunderstorm_outlined,
                temp: "18°",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
