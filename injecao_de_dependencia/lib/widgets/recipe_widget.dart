import 'package:flutter/material.dart';

import '../controllers/recipes_controller.dart';
import '../models/recipe_model.dart';
import 'recipe_favorite_button_widget.dart';
import 'recipe_info_widget.dart';
import 'recipe_picture_widget.dart';

class RecipeWidget extends StatelessWidget {
  final RecipeModel recipe;
  final RecipesController recipesCtrl;
  const RecipeWidget({
    super.key,
    required this.recipe,
    required this.recipesCtrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            RecipePictureWidget(
              imagePath: recipe.imgPath,
            ),
            RecipeInfoWidget(
              recipe: recipe,
            ),
            const Spacer(),
            RecipeFavoriteButtonWidget(
              recipe: recipe,
              recipesCtrl: recipesCtrl,
            ),
          ],
        ),
        const Divider(height: 1),
      ],
    );
  }
}
