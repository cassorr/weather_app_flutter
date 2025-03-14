import 'package:flutter/material.dart';

class MenuView extends StatelessWidget {
  const MenuView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'), // Title set to "Weather"
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add), // Plus Button
            tooltip: 'Add New Item',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('New item added!')),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text('This is the menu view', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
