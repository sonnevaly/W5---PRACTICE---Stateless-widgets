import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: const Text('My Hobbies'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              HobbyCard(
                icon: Icons.travel_explore,
                title: 'Travelling',
                color: Colors.green,
              ),
              SizedBox(height: 30),
              HobbyCard(
                icon: Icons.ice_skating,
                title: 'Skating',
                color: Colors.blueGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const HobbyCard({
    super.key,
    required this.icon,
    required this.title,
    this.color = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: color,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 30),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Icon(icon, color: Colors.white, size: 32),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
