import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '/widgets/recipe_card.dart';

class RecipesListScreen extends StatelessWidget {
  const RecipesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'My recipes',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: MasonryGridView.count(
          crossAxisCount: 2,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          itemCount: _recipes.length,
          itemBuilder: (context, index) {
            final recipe = _recipes[index];
            return RecipeCard(
              imagePath: recipe.imagePath,
              title: recipe.title,
              description: recipe.description,
              duration: recipe.duration,
              servings: recipe.servings,
            );
          },
        ),
      ),
    );
  }

  static final List<_Recipe> _recipes = [
    _Recipe(
      imagePath: 'assets/images/pumpkin_soup.jpg',
      title: 'Pumpkin Soup',
      description: 'A creamy and warming soup perfect for autumn.',
      duration: 30,
      servings: 4,
    ),
    _Recipe(
      imagePath: 'assets/images/curry_soup.jpg',
      title: 'Vegan Thai Curry Soup',
      description: 'Spicy and aromatic Thai-style curry soup.',
      duration: 45,
      servings: 4,
    ),
    _Recipe(
      imagePath: 'assets/images/pumpkin_soup.jpg',
      title: 'Pumpkin Soup',
      description: 'A creamy and warming soup perfect for autumn.',
      duration: 30,
      servings: 4,
    ),_Recipe(
      imagePath: 'assets/images/pumpkin_soup.jpg',
      title: 'Pumpkin Soup',
      description: 'A creamy and warming soup perfect for autumn.',
      duration: 30,
      servings: 4,
    ),
    _Recipe(
      imagePath: 'assets/images/curry_soup.jpg',
      title: 'Vegan Thai Curry Soup',
      description: 'Spicy and aromatic Thai-style curry soup.',
      duration: 45,
      servings: 4,
    ),
    _Recipe(
      imagePath: 'assets/images/curry_soup.jpg',
      title: 'Vegan Thai Curry Soup',
      description: 'Spicy and aromatic Thai-style curry soup.',
      duration: 45,
      servings: 4,
    ),
    _Recipe(
      imagePath: 'assets/images/pumpkin_soup.jpg',
      title: 'Pumpkin Soup',
      description: 'A creamy and warming soup perfect for autumn.',
      duration: 30,
      servings: 4,
    ),
    _Recipe(
      imagePath: 'assets/images/curry_soup.jpg',
      title: 'Vegan Thai Curry Soup',
      description: 'Spicy and aromatic Thai-style curry soup.',
      duration: 45,
      servings: 4,
    ),
    
    // Add more recipes as needed
  ];
}

class _Recipe {
  final String imagePath;
  final String title;
  final String description;
  final int duration;
  final int servings;

  const _Recipe({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.duration,
    required this.servings,
  });
}