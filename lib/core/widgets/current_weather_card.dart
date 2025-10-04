import 'package:flutter/material.dart';
import '../models/weather_model.dart'; // استدعاء الـ Model
import 'glass_card.dart';

class CurrentWeatherCard extends StatelessWidget {
  // 1. استقبل object من نوع CurrentWeather
  final CurrentWeather currentData;

  const CurrentWeatherCard({super.key, required this.currentData});

  // دالة مساعدة لتحويل كود الأيقونة من الـ API إلى أيقونة Material
  IconData _mapWeatherIcon(String iconCode) {
    switch (iconCode.substring(0, 2)) {
      case '01':
        return Icons.wb_sunny_outlined;
      case '02':
        return Icons.cloud_queue_outlined;
      case '03':
      case '04':
        return Icons.cloud_outlined;
      case '09':
        return Icons.grain_outlined;
      case '10':
        return Icons.water_drop_outlined;
      case '11':
        return Icons.thunderstorm_outlined;
      case '13':
        return Icons.ac_unit_outlined;
      case '50':
        return Icons.foggy;
      default:
        return Icons.cloud_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return GlassmorphismCard(
      width: double.infinity,
      child: Column(
        children: [
          // 2. استخدام خصائص الـ object مباشرة
          _buildLocationHeader(textTheme, colorScheme, currentData.name),
          const SizedBox(height: 16),
          _buildCurrentWeather(textTheme, colorScheme, currentData),
          const SizedBox(height: 16),
          _buildWeatherDetails(textTheme, colorScheme, currentData),
        ],
      ),
    );
  }

  Widget _buildLocationHeader(
    TextTheme textTheme,
    ColorScheme colorScheme,
    String location,
  ) {
    return Row(
      children: [
        Icon(Icons.location_on_outlined, color: colorScheme.onSurface),
        const SizedBox(width: 8),
        Text(
          location,
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

  Widget _buildCurrentWeather(
    TextTheme textTheme,
    ColorScheme colorScheme,
    CurrentWeather data,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${data.main.temp.toStringAsFixed(0)}°", // استخدام أنظف
              style: textTheme.displayMedium?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              data.weather.description, // استخدام أنظف
              style: textTheme.headlineSmall?.copyWith(
                color: colorScheme.onSurface.withAlpha(204),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 100,
          height: 100,
          child: Icon(
            _mapWeatherIcon(data.weather.icon),
            size: 60,
            color: colorScheme.onSurface,
          ),
        ),
      ],
    );
  }

  Widget _buildWeatherDetails(
    TextTheme textTheme,
    ColorScheme colorScheme,
    CurrentWeather data,
  ) {
    return Row(
      children: [
        Icon(Icons.air, size: 20, color: colorScheme.onSurface),
        const SizedBox(width: 8),
        Text(
          "${data.wind.speed} m/s", // استخدام أنظف
          style: textTheme.bodyLarge?.copyWith(color: colorScheme.onSurface),
        ),
        const SizedBox(width: 24),
        Icon(Icons.water_drop_outlined, size: 20, color: colorScheme.onSurface),
        const SizedBox(width: 8),
        Text(
          "${data.main.humidity}%", // استخدام أنظف
          style: textTheme.bodyLarge?.copyWith(color: colorScheme.onSurface),
        ),
      ],
    );
  }
}
