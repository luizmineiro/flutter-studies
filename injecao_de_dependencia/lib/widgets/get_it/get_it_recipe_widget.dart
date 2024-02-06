import 'package:flutter/material.dart';

import '../../models/recipe_model.dart';
import 'get_it_recipe_favorite_button_widget.dart';
import 'get_it_recipe_info_widget.dart';
import 'get_it_recipe_picture_widget.dart';

class GetItRecipeWidget extends StatelessWidget {
  final RecipeModel recipe;

  const GetItRecipeWidget({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            GetItRecipePictureWidget(
              imagePath: recipe.imgPath,
            ),
            GetItRecipeInfoWidget(
              recipe: recipe,
            ),
            const Spacer(),
            GetItRecipeFavoriteButtonWidget(
              recipe: recipe,
            ),
          ],
        ),
        const Divider(height: 1),
      ],
    );
  }
}
