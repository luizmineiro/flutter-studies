import 'package:flutter/material.dart';
import 'package:injecao_de_dependencia/models/recipe_model.dart';

class GetItRecipeInfoWidget extends StatelessWidget {
  final RecipeModel recipe;
  const GetItRecipeInfoWidget({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            recipe.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '${recipe.calories} kCal',
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 6),
          Text(
            recipe.prepTime,
            style: const TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
