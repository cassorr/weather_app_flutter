import 'package:flutter/material.dart';
import 'city_view.dart';
import 'add_city_view.dart'; // Added import

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add New City',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddCityView()),
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCityTile(
            context,
            cityName: 'Missoula, MT',
            temperature: '23°',
            conditionIcon: Icons.ac_unit,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildCityTile(
      BuildContext context, {
        required String cityName,
        required String temperature,
        required IconData conditionIcon,
      }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CityView()),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1A1B3C), // Slightly lighter than background
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(conditionIcon, size: 40, color: Colors.white),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  cityName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  temperature,
                  style: const TextStyle(fontSize: 28, color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
