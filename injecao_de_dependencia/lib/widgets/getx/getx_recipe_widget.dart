import 'package:flutter/material.dart';

import '../../models/recipe_model.dart';
import 'getx_recipe_favorite_button_widget.dart';
import 'getx_recipe_info_widget.dart';
import 'getx_recipe_picture_widget.dart';

class GetxRecipeWidget extends StatelessWidget {
  final RecipeModel recipe;

  const GetxRecipeWidget({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GetxRecipePictureWidget(
              imagePath: recipe.imgPath,
            ),
            GetxRecipeInfoWidget(
              recipe: recipe,
            ),
            const Spacer(),
            GetxRecipeFavoriteButtonWidget(
              recipe: recipe,
            ),
          ],
        ),
        const Divider(height: 1),
      ],
    );
  }
}
