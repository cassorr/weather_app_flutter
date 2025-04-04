import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class WeatherService {
  final String apiKey = dotenv.env['WEATHERSTACK_API_KEY'] ?? '';

  Future<Map<String, dynamic>?> fetchWeather(String cityName) async {
    if (apiKey.isEmpty) {
      print('API key is missing. Check your .env file.');
      return null;
    }

    final url = Uri.parse(
      'http://api.weatherstack.com/current?access_key=$apiKey&query=$cityName',
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);

        if (data.containsKey('current')) {
          return data;
        } else {
          print('Invalid response: $data');
          return null;
        }
      } else {
        print('Failed to load weather: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error fetching weather: $e');
      return null;
    }
  }
}
