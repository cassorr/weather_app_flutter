import 'package:flutter/material.dart';

class CityView extends StatelessWidget {
  const CityView({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for testing
    final List<Map<String, dynamic>> hourly = [
      {'time': 'Now', 'temp': 23},
      {'time': '1 AM', 'temp': 23},
      {'time': '2 AM', 'temp': 23},
      {'time': '3 AM', 'temp': 23},
      {'time': '4 AM', 'temp': 23},
      {'time': '5 AM', 'temp': 22},
      {'time': '6 AM', 'temp': 22},
      {'time': '7 AM', 'temp': 22},
      {'time': '8 AM', 'temp': 21},
      {'time': '9 AM', 'temp': 21},
      {'time': '10 AM', 'temp': 20},
      {'time': '11 AM', 'temp': 20},
      {'time': '12 PM', 'temp': 19},
    ];

    final Map<String, int> weekly = {
      'Today': 30,
      'Tue': 28,
      'Wed': 25,
      'Thu': 22,
      'Fri': 20,
      'Sat': 18,
      'Sun': 17,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Missoula, MT'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text(
              '23°',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Snowy',
              style: TextStyle(fontSize: 20, color: Colors.white70),
            ),
            const SizedBox(height: 24),

            // Hourly Forecast
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Hourly Forecast',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 80,
              child: Center(
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: hourly.length,
                  itemBuilder: (context, index) {
                    final item = hourly[index];
                    return _forecastTile(item['time'], '${item['temp']}°');
                  },
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Weekly Forecast
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Weekly Forecast',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: weekly.entries.map((entry) {
                return _forecastTile(entry.key, '${entry.value}°', width: 60);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _forecastTile(String label, String value, {double width = 70}) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF2E2B5F),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: const TextStyle(fontSize: 14, color: Colors.white)),
          const SizedBox(height: 4),
          Text(value, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
