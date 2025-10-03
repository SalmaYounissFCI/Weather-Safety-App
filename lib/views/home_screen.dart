import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../core/theme/app_colors.dart';
import '../core/widgets/bottom_navigation_bar.dart';
import '../core/widgets/current_weather_card.dart';
import '../core/widgets/forecast_section.dart';
import '../core/widgets/glass_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 16),
                        const CurrentWeatherCard(),
                        const SizedBox(height: 24),

                        ForecastSection(),
                        const SizedBox(height: 24),

                        const HydrationTipCard(),
                        const SizedBox(height: 24),
                        const TemperatureTrendCard(),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
                const BottomNavBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HydrationTipCard extends StatelessWidget {
  const HydrationTipCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return GlassmorphismCard(
      width: double.infinity,
      borderColor: Colors.green.withAlpha(150),
      child: Row(
        children: [
          Icon(Icons.water_drop_outlined, color: Colors.green),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Stay Hydrated",
                  style: textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                Text(
                  "Moderate humidity levels. Drink water regularly.",
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface.withAlpha(204),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TemperatureTrendCard extends StatelessWidget {
  const TemperatureTrendCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return GlassmorphismCard(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.trending_up, color: colorScheme.onSurface),
              const SizedBox(width: 12),
              Text(
                "September Temperature Trends",
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(height: 150, child: LineChart(_buildChartData(colorScheme))),
          const SizedBox(height: 16),
          GlassmorphismCard(
            width: double.infinity,
            child: Text(
              "September is trending hotter each year. Morning activities between 7-10 AM are recommended for outdoor events.",
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurface.withAlpha(204),
              ),
            ),
          ),
        ],
      ),
    );
  }

  LineChartData _buildChartData(ColorScheme colorScheme) {
    return LineChartData(
      gridData: const FlGridData(show: false),
      titlesData: FlTitlesData(
        leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: (value, meta) {
              String text = '';
              switch (value.toInt()) {
                case 0:
                  text = '2020';
                  break;
                case 1:
                  text = '2021';
                  break;
                case 2:
                  text = '2022';
                  break;
                case 3:
                  text = '2023';
                  break;
                case 4:
                  text = '2024';
                  break;
                case 5:
                  text = '2025';
                  break;
              }
              return SideTitleWidget(
                axisSide: meta.axisSide,
                child: Text(
                  text,
                  style: TextStyle(
                    color: colorScheme.onSurface.withAlpha(150),
                    fontSize: 12,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      borderData: FlBorderData(show: false),
      lineBarsData: [
        LineChartBarData(
          spots: const [
            FlSpot(0, 20),
            FlSpot(1, 21.5),
            FlSpot(2, 22),
            FlSpot(3, 23),
            FlSpot(4, 24.5),
            FlSpot(5, 26),
          ],
          isCurved: true,
          color: Colors.blue,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: true),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: [Colors.blue.withAlpha(50), Colors.blue.withAlpha(0)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ],
    );
  }
}
