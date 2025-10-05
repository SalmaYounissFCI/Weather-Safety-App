import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../../core/models/weather_model.dart';
import '../../core/services/location_service.dart';
import '../../core/services/smart_info_service.dart';
import '../../core/services/weather_service.dart';
import '../../core/widgets/current_weather_card.dart';
import '../../core/widgets/forecast_section.dart';
import '../../core/widgets/info_card.dart';
import '../../core/widgets/location_permission_dialog.dart';
import '../../core/widgets/temperature_trend_card.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  Future<List<dynamic>>? _weatherDataFuture;

  @override
  void initState() {
    super.initState();
    _weatherDataFuture = _fetchWeatherData();
  }

  Future<List<dynamic>> _fetchWeatherData() async {
    try {
      final Position position = await LocationService.getCurrentPosition();
      return Future.wait([
        WeatherService.fetchCurrentWeather(
          position.latitude,
          position.longitude,
        ),
        WeatherService.fetch5DayForecast(position.latitude, position.longitude),
      ]);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> _refreshWeatherData() async {
    setState(() {
      _weatherDataFuture = _fetchWeatherData();
    });
  }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) => LocationPermissionDialog(
        onAllowPressed: () {
          Navigator.of(context).pop();
          _refreshWeatherData();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: RefreshIndicator(
        onRefresh: _refreshWeatherData,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: FutureBuilder<List<dynamic>>(
              future: _weatherDataFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    heightFactor: 10,
                    child: CircularProgressIndicator(color: Colors.white),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    heightFactor: 10,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_off,
                            color: Colors.red,
                            size: 60,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Location Access Needed",
                            style: textTheme.headlineSmall,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            "Please grant location permission to see weather information for your area.",
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: _showPermissionDialog,
                            child: const Text("Grant Permission"),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                if (snapshot.hasData) {
                  final currentData = snapshot.data![0] as CurrentWeather;
                  final forecastData = snapshot.data![1] as ForecastResponse;

                  final infoCardDataList = SmartInfoService.generateInfoCards(
                    currentData: currentData,
                    forecastData: forecastData,
                  );

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 16),
                      CurrentWeatherCard(currentData: currentData),
                      const SizedBox(height: 24),
                      ForecastSection(forecastData: forecastData),
                      const SizedBox(height: 24),
                      Text(
                        "Safety Tips",
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: infoCardDataList.length,
                        itemBuilder: (context, index) {
                          final cardData = infoCardDataList[index];
                          return InfoCard(infoCardData: cardData);
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                      ),
                      const SizedBox(height: 24),
                      const TemperatureTrendCard(),
                      const SizedBox(height: 120),
                    ],
                  );
                }
                return const Center(child: Text("No data available."));
              },
            ),
          ),
        ),
      ),
    );
  }
}
