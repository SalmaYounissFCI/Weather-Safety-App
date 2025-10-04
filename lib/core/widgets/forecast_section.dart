import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/weather_model.dart'; // استدعاء الـ Model
import 'forecast_card.dart';

class ForecastSection extends StatelessWidget {
  // 1. استقبل object من نوع ForecastResponse
  final ForecastResponse forecastData;

  const ForecastSection({super.key, required this.forecastData});

  // دالة مساعدة لفلترة البيانات وعرض توقع واحد لكل يوم
  List<ForecastItem> _filterDailyForecasts(List<ForecastItem> list) {
    final Map<String, ForecastItem> dailyData = {};
    for (var item in list) {
      final date = DateTime.fromMillisecondsSinceEpoch(item.dt * 1000);
      // نأخذ توقع الساعة 12 ظهراً لكل يوم
      if (date.hour == 12) {
        final dayKey = DateFormat('yyyy-MM-dd').format(date);
        dailyData[dayKey] = item;
      }
    }
    // كود احتياطي في حالة عدم وجود توقع الساعة 12
    if (dailyData.length < 5) {
      for (var item in list) {
        final dayKey = DateFormat(
          'yyyy-MM-dd',
        ).format(DateTime.fromMillisecondsSinceEpoch(item.dt * 1000));
        if (!dailyData.containsKey(dayKey)) {
          dailyData[dayKey] = item;
        }
      }
    }
    return dailyData.values.toList();
  }

  // دالة مساعدة لتحويل كود الأيقونة من الـ API إلى أيقونة Material
  IconData _mapWeatherIcon(String iconCode) {
    switch (iconCode.substring(0, 2)) {
      case '01': // clear sky
        return Icons.wb_sunny_outlined;
      case '02': // few clouds
        return Icons.cloud_queue_outlined;
      case '03': // scattered clouds
      case '04': // broken clouds
        return Icons.cloud_outlined;
      case '09': // shower rain
        return Icons.grain_outlined;
      case '10': // rain
        return Icons.water_drop_outlined;
      case '11': // thunderstorm
        return Icons.thunderstorm_outlined;
      case '13': // snow
        return Icons.ac_unit_outlined;
      case '50': // mist
        return Icons.foggy;
      default:
        return Icons.cloud_outlined;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    if (forecastData.list.isEmpty) {
      return const SizedBox.shrink(); // لا تعرض شيئًا إذا لم تكن هناك بيانات
    }

    final dailyForecasts = _filterDailyForecasts(forecastData.list);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "5-Day Forecast",
          style: textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 135,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: dailyForecasts.length,
            itemBuilder: (context, index) {
              final item = dailyForecasts[index];

              // 2. استخدام خصائص الـ object مباشرة
              final day = DateFormat(
                'E',
              ).format(DateTime.fromMillisecondsSinceEpoch(item.dt * 1000));
              final icon = _mapWeatherIcon(item.weather.icon);
              final temp = "${item.main.temp.toStringAsFixed(0)}°";

              // 3. بناء الـ Card باستخدام البيانات الحقيقية
              return ForecastCard(day: day, icon: icon, temp: temp);
            },
          ),
        ),
      ],
    );
  }
}
