import 'package:flutter/material.dart';
import 'views/menu_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0B0C2A),
        primaryColor: const Color(0xFF6C63FF),
        cardColor: const Color(0xFF2E2B5F),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0B0C2A),
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
          titleLarge: TextStyle(color: Colors.white, fontSize: 24),
          titleMedium: TextStyle(color: Colors.white70, fontSize: 18),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        useMaterial3: true,
      ),
      home: const MenuView(),
    );
  }
}
