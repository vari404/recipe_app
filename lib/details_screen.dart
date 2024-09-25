import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Map<String, dynamic> recipe;

  const DetailsScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe['name']),
      ),
      body: Column(
        children: [
          Image.asset(
            recipe['image'],
            height: 220,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                Text(
                  'Ingredients',
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                ...recipe['ingredients'].map<Widget>(
                      (ingredient) => ListTile(
                    leading: const Icon(Icons.check_circle_outline),
                    title: Text(ingredient),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Instructions',
                  style: const TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                ...recipe['instructions'].asMap().entries.map<Widget>(
                      (entry) => ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.deepOrangeAccent,
                      child: Text(
                        '${entry.key + 1}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(entry.value),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
