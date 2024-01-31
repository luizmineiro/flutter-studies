import 'package:flutter/material.dart';
import 'package:injecao_de_dependencia/controllers/recipes_controller.dart';
import 'package:injecao_de_dependencia/models/recipe_model.dart';

class RecipeFavoriteButtonWidget extends StatelessWidget {
  final RecipeModel recipe;
  final RecipesController recipesCtrl;
  const RecipeFavoriteButtonWidget(
      {super.key, required this.recipe, required this.recipesCtrl});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: recipe.isFavorite,
      builder: (_, bool isFavorite, __) {
        return IconButton(
          onPressed: () {
            recipesCtrl.markAsFavorite(recipe.id, !isFavorite);
          },
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: Colors.red,
          ),
        );
      },
    );
  }
}
