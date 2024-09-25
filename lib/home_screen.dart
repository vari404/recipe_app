import 'package:flutter/material.dart';
import 'details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> recipes = const [
    {
      'name': 'Lobster Mac and Cheese',
      'image': 'assets/lobster_mac_cheese.jpg',
      'ingredients': [
        '1 lb macaroni',
        '2 cups cheddar cheese',
        '1 cup lobster meat',
      ],
      'instructions': [
        'Boil macaroni until al dente.',
        'Prepare cheese sauce.',
        'Mix macaroni with sauce and lobster.',
        'Bake for 20 minutes.',
      ],
    },
    {
      'name': 'Cheeseburger',
      'image': 'assets/cheeseburger.jpg',
      'ingredients': [
        '1 lb ground beef',
        '4 slices of cheese',
        '4 hamburger buns',
      ],
      'instructions': [
        'Form beef into patties.',
        'Grill patties to desired doneness.',
        'Place cheese on patties.',
        'Assemble burgers with buns and toppings.',
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Delish Recipes'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12.0),
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => DetailsScreen(recipe: recipes[index]),
                ),
              );
            },
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(15.0)),
                    child: Image.asset(
                      recipes[index]['image'],
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  ListTile(
                    title: Text(
                      recipes[index]['name'],
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    trailing: const Icon(Icons.keyboard_arrow_right),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

