class Weather {
  final int temperature;
  final String condition;
  final String icon;
  final int uvIndex;
  final int humidity;
  final int visibility;
  final int windSpeed;
  final int pressure;
  final int cloudcover;
  final int feelslike;
  final String sunrise;
  final String sunset;
  final int airQuality;

  Weather({
    required this.temperature,
    required this.condition,
    required this.icon,
    required this.uvIndex,
    required this.humidity,
    required this.visibility,
    required this.windSpeed,
    required this.pressure,
    required this.cloudcover,
    required this.feelslike,
    required this.sunrise,
    required this.sunset,
    required this.airQuality,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      temperature: json['temperature'],
      condition: json['condition'],
      icon: json['icon'],
      uvIndex: json['uv_index'],
      humidity: json['humidity'],
      visibility: json['visibility'],
      windSpeed: json['wind_speed'],
      pressure: json['pressure'],
      cloudcover: json['cloudcover'],
      feelslike: json['feelslike'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
      airQuality: json['air_quality'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temperature': temperature,
      'condition': condition,
      'icon': icon,
      'uv_index': uvIndex,
      'humidity': humidity,
      'visibility': visibility,
      'wind_speed': windSpeed,
      'pressure': pressure,
      'cloudcover': cloudcover,
      'feelslike': feelslike,
      'sunrise': sunrise,
      'sunset': sunset,
      'air_quality': airQuality,
    };
  }
}
