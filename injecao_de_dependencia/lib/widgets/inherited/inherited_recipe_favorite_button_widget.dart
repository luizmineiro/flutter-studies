import 'package:flutter/material.dart';
import 'package:injecao_de_dependencia/models/recipe_model.dart';

import 'recipes_inherted_widget.dart';

class InheritedRecipeFavoriteButtonWidget extends StatelessWidget {
  final RecipeModel recipe;
  const InheritedRecipeFavoriteButtonWidget({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    final recipesCtrl = RecipesInhertedWidget.of(context)!.recipesController;

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
