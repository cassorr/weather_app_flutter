import 'weather.dart';

class City {
  final String name;
  final String country;
  final double lat;
  final double lon;
  final Weather weather;

  City({
    required this.name,
    required this.country,
    required this.lat,
    required this.lon,
    required this.weather,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      name: json['name'],
      country: json['country'],
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      weather: Weather.fromJson(json['weather']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'country': country,
      'lat': lat,
      'lon': lon,
      'weather': weather.toJson(),
    };
  }
}
