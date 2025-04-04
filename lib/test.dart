import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'models/city.dart';
import 'models/weather.dart';
import 'services/firestore_service.dart';
import 'services/weather_service.dart';

Future<void> runWeatherTest() async {
  print('App starting...');
  await dotenv.load(fileName: ".env");
  print('.env loaded');

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: dotenv.env['FIREBASE_API_KEY']!,
      authDomain: dotenv.env['FIREBASE_AUTH_DOMAIN'],
      projectId: dotenv.env['FIREBASE_PROJECT_ID']!,
      storageBucket: dotenv.env['FIREBASE_STORAGE_BUCKET'],
      messagingSenderId: dotenv.env['FIREBASE_MESSAGING_SENDER_ID']!,
      appId: dotenv.env['FIREBASE_APP_ID']!,
      measurementId: dotenv.env['FIREBASE_MEASUREMENT_ID'],
    ),
  );
  print('Firebase initialized');

  final weatherService = WeatherService();
  final firestoreService = FirestoreService();

  print('Fetching weather...');
  final weatherData = await weatherService.fetchWeather('Missoula');

  print('Weather fetch result: $weatherData');

  if (weatherData != null) {
    final weather = Weather(
      temperature: weatherData['current']['temperature'] ?? 0,
      feelslike: weatherData['current']['feelslike'] ?? 0,
      condition: (weatherData['current']['weather_descriptions'] as List).first,
      icon: (weatherData['current']['weather_icons'] as List).first,
      windSpeed: weatherData['current']['wind_speed'] ?? 0,
      pressure: weatherData['current']['pressure'] ?? 0,
      humidity: weatherData['current']['humidity'] ?? 0,
      uvIndex: weatherData['current']['uv_index'] ?? 0,
      visibility: weatherData['current']['visibility'] ?? 0,
      airQuality: int.tryParse(
        weatherData['current']['air_quality']['us-epa-index'].toString(),
      ) ?? 0,
      cloudcover: weatherData['current']['cloudcover'] ?? 0,
      sunrise: weatherData['current']['astro']?['sunrise'] ?? 'N/A',
      sunset: weatherData['current']['astro']?['sunset'] ?? 'N/A',
    );

    final city = City(
      name: weatherData['location']['name'],
      country: weatherData['location']['country'],
      lat: double.tryParse(weatherData['location']['lat'].toString()) ?? 0.0,
      lon: double.tryParse(weatherData['location']['lon'].toString()) ?? 0.0,
      weather: weather,
    );

    print('JSON being saved:');
    print(city.toJson());
    print('Saving to Firestore...');
    await firestoreService.saveCity(city);
    print('City saved!');
  } else {
    print('Failed to fetch weather data.');
  }
}

// void main() => runWeatherTest();
