import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:intl/intl.dart';
import '../../core/constants.dart';
import '../../core/models/weather_model.dart';
import '../../core/services/weather_service.dart' hide openWeatherApiKey;

enum MapLayerType { satellite, precipitation }

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String _currentDate = '';
  MapLayerType _selectedLayer = MapLayerType.satellite;
  Marker? _tappedMarker;

  @override
  void initState() {
    super.initState();
    _currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  void _selectLayer(MapLayerType layerType) {
    setState(() {
      _selectedLayer = layerType;
    });
  }

  Future<void> _handleTap(LatLng tappedPoint) async {
    setState(() {
      _tappedMarker = Marker(
        point: tappedPoint,
        width: 40,
        height: 40,
        child: const CircularProgressIndicator(),
      );
    });

    try {
      final weatherData = await WeatherService.fetchCurrentWeather(
        tappedPoint.latitude,
        tappedPoint.longitude,
      );

      setState(() {
        _tappedMarker = Marker(
          point: tappedPoint,
          width: 160,
          height: 80,
          child: _buildWeatherTooltip(weatherData),
        );
      });
    } catch (e) {
      setState(() {
        _tappedMarker = null;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Could not fetch weather data for this location.'),
          ),
        );
      }
    }
  }

  Widget _buildWeatherTooltip(CurrentWeather data) {
    final theme = Theme.of(context);
    return Card(
      color: theme.cardColor.withOpacity(0.9),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                data.name,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                '${data.main.temp.toStringAsFixed(0)}°C',
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 4),
              Text(data.weather.description, style: theme.textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _selectedLayer == MapLayerType.satellite
              ? 'Live Satellite View'
              : 'Precipitation Radar',
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              initialCenter: const LatLng(30.0444, 31.2357),
              initialZoom: 6.0,
              onTap: (tapPosition, point) => _handleTap(point),
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.weatherapp',
              ),
              if (_selectedLayer == MapLayerType.satellite)
                Opacity(
                  opacity: 0.7,
                  child: TileLayer(
                    urlTemplate:
                        'https://map1.vis.earthdata.nasa.gov/wmts-webmerc/MODIS_Terra_CorrectedReflectance_TrueColor/default/$_currentDate/GoogleMapsCompatible_Level9/{z}/{y}/{x}.jpg',
                  ),
                ),
              if (_selectedLayer == MapLayerType.precipitation)
                Opacity(
                  opacity: 0.8,
                  child: TileLayer(
                    urlTemplate:
                        'https://tile.openweathermap.org/map/precipitation_new/{z}/{x}/{y}.png?appid=$openWeatherApiKey',
                  ),
                ),
              if (_tappedMarker != null) MarkerLayer(markers: [_tappedMarker!]),
            ],
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: Column(
              children: [
                FloatingActionButton(
                  heroTag: 'satellite_button',
                  onPressed: () => _selectLayer(MapLayerType.satellite),
                  backgroundColor: _selectedLayer == MapLayerType.satellite
                      ? theme.primaryColor
                      : theme.cardColor,
                  child: Icon(
                    Icons.satellite_alt_outlined,
                    color: _selectedLayer == MapLayerType.satellite
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 10),
                FloatingActionButton(
                  heroTag: 'precipitation_button',
                  onPressed: () => _selectLayer(MapLayerType.precipitation),
                  backgroundColor: _selectedLayer == MapLayerType.precipitation
                      ? theme.primaryColor
                      : theme.cardColor,
                  child: Icon(
                    Icons.water_drop_outlined,
                    color: _selectedLayer == MapLayerType.precipitation
                        ? theme.colorScheme.onPrimary
                        : theme.colorScheme.onSurface,
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
