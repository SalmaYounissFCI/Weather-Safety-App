import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'glass_card.dart';

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
              GlassmorphismCard(
                isPadded: false,
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.trending_up,
                    color: colorScheme.onSurface,
                    size: 24,
                  ),
                ),
              ),

              const SizedBox(width: 16),
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
          SizedBox(
            height: 150,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: LineChart(_buildChartData(colorScheme)),
            ),
          ),
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
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: colorScheme.onSurface.withAlpha(50),
            strokeWidth: 1,
            dashArray: [5, 5],
          );
        },
      ),

      titlesData: FlTitlesData(
        leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 35,
            interval: 1,
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
                space: 10.0,
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
