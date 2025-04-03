import 'package:flutter/material.dart';

class AddCityView extends StatelessWidget {
  const AddCityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add City'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Search Input
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF2E2B5F),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white54),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  border: InputBorder.none,
                ),
              ),
            ),

            // Add space for future search results
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
