import 'package:flutter/material.dart';
import '../../core/models/weather_model.dart';
import '../../core/services/weather_service.dart';
import '../../core/widgets/current_weather_card.dart';
import '../../core/widgets/forecast_section.dart';
import '../../core/widgets/info_card.dart';
import '../../core/widgets/temperature_trend_card.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  // الـ Future سيحتوي على قائمة من الـ Models
  late Future<List<dynamic>> _weatherDataFuture;
  final double lat = 27.27; // خط عرض القاهرة
  final double lon = 31.15; // خط طول القاهرة

  @override
  void initState() {
    super.initState();
    // استدعاء البيانات لأول مرة
    _weatherDataFuture = _fetchWeatherData();
  }

  // ✅ 1. إنشاء دالة منفصلة لجلب البيانات
  Future<List<dynamic>> _fetchWeatherData() {
    // استدعاء الدوال التي تعيد Models
    return Future.wait([
      WeatherService.fetchCurrentWeather(lat, lon),
      WeatherService.fetch5DayForecast(lat, lon),
    ]);
  }

  // ✅ دالة لإعادة تحميل البيانات عند السحب
  Future<void> _refreshWeatherData() async {
    setState(() {
      _weatherDataFuture = _fetchWeatherData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // ✅ 2. استخدام RefreshIndicator
      child: RefreshIndicator(
        onRefresh: _refreshWeatherData,
        child: SingleChildScrollView(
          physics:
              const AlwaysScrollableScrollPhysics(), // لجعل السحب يعمل دائمًا
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            // استخدام FutureBuilder لانتظار البيانات
            child: FutureBuilder<List<dynamic>>(
              future: _weatherDataFuture,
              builder: (context, snapshot) {
                // 1. حالة التحميل
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    heightFactor: 10,
                    child: CircularProgressIndicator(),
                  );
                }
                // 2. حالة الخطأ
                if (snapshot.hasError) {
                  return Center(
                    child: Text("Error fetching data: ${snapshot.error}"),
                  );
                }
                // 3. حالة النجاح
                if (snapshot.hasData) {
                  // تحويل البيانات إلى الـ Models الصحيحة
                  final currentData = snapshot.data![0] as CurrentWeather;
                  final forecastData = snapshot.data![1] as ForecastResponse;

                  // بناء الواجهة بالبيانات الحقيقية
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      // تمرير الـ model object إلى الويدجت
                      CurrentWeatherCard(currentData: currentData),
                      const SizedBox(height: 24),
                      // تمرير الـ model object إلى الويدجت
                      ForecastSection(forecastData: forecastData),
                      const SizedBox(height: 24),
                      const InfoCard(
                        icon: Icons.invert_colors,
                        title: "Rain Expected",
                        message:
                            "Heavy rainfall in 2 hours. Carry an umbrella and avoid low-lying areas.",
                        color: Colors.red,
                      ),
                      const SizedBox(height: 16),
                      const InfoCard(
                        icon: Icons.wb_sunny_outlined,
                        title: "UV Index: Moderate",
                        message:
                            "Apply sunscreen if outdoors for extended periods.",
                        color: Colors.orange,
                      ),
                      const SizedBox(height: 16),
                      const InfoCard(
                        icon: Icons.waves,
                        title: "Stay Hydrated",
                        message:
                            "Moderate humidity levels. Drink water regularly throughout the day.",
                        color: Colors.green,
                      ),
                      const SizedBox(height: 24),
                      const TemperatureTrendCard(),
                      const SizedBox(height: 120),
                    ],
                  );
                }

                // الحالة الافتراضية
                return const Center(child: Text("No data available."));
              },
            ),
          ),
        ),
      ),
    );
  }
}
