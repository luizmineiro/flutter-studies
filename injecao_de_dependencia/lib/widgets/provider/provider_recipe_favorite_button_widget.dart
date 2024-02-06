import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:injecao_de_dependencia/controllers/recipes_controller.dart';
import 'package:injecao_de_dependencia/models/recipe_model.dart';

class ProviderRecipeFavoriteButtonWidget extends StatelessWidget {
  final RecipeModel recipe;
  const ProviderRecipeFavoriteButtonWidget({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    final recipesCtrl = Get.find<RecipesController>();

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
