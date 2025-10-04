// هذا الكلاس يمثل الاستجابة الكاملة للطقس الحالي
class CurrentWeather {
  final String name;
  final MainInfo main;
  final WeatherInfo weather;
  final WindInfo wind;

  CurrentWeather({
    required this.name,
    required this.main,
    required this.weather,
    required this.wind,
  });

  // هذه الدالة تقوم ببناء object من الـ JSON
  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      name: json['name'] ?? 'Unknown',
      main: MainInfo.fromJson(json['main']),
      weather: WeatherInfo.fromJson(json['weather'][0]),
      wind: WindInfo.fromJson(json['wind']),
    );
  }
}

// كلاس مساعد للمعلومات الرئيسية
class MainInfo {
  final double temp;
  final int humidity;

  MainInfo({required this.temp, required this.humidity});

  factory MainInfo.fromJson(Map<String, dynamic> json) {
    return MainInfo(
      temp: (json['temp'] as num).toDouble(),
      humidity: json['humidity'] as int,
    );
  }
}

// كلاس مساعد لوصف الطقس
class WeatherInfo {
  final String description;
  final String icon;

  WeatherInfo({required this.description, required this.icon});

  factory WeatherInfo.fromJson(Map<String, dynamic> json) {
    return WeatherInfo(
      description: json['description'] ?? '',
      icon: json['icon'] ?? '',
    );
  }
}

// كلاس مساعد لمعلومات الرياح
class WindInfo {
  final double speed;

  WindInfo({required this.speed});

  factory WindInfo.fromJson(Map<String, dynamic> json) {
    return WindInfo(speed: (json['speed'] as num).toDouble());
  }
}

// --- Models for Forecast ---

// هذا الكلاس يمثل الاستجابة الكاملة للتوقعات
class ForecastResponse {
  final List<ForecastItem> list;

  ForecastResponse({required this.list});

  factory ForecastResponse.fromJson(Map<String, dynamic> json) {
    return ForecastResponse(
      list: (json['list'] as List)
          .map((item) => ForecastItem.fromJson(item))
          .toList(),
    );
  }
}

// هذا الكلاس يمثل كل عنصر في قائمة التوقعات
class ForecastItem {
  final int dt;
  final MainInfo main;
  final WeatherInfo weather;

  ForecastItem({required this.dt, required this.main, required this.weather});

  factory ForecastItem.fromJson(Map<String, dynamic> json) {
    return ForecastItem(
      dt: json['dt'] as int,
      main: MainInfo.fromJson(json['main']),
      weather: WeatherInfo.fromJson(json['weather'][0]),
    );
  }
}
