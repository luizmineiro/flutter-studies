import 'package:flutter/material.dart';

import '../../models/recipe_model.dart';
import 'provider_recipe_favorite_button_widget.dart';
import 'provider_recipe_info_widget.dart';
import 'provider_recipe_picture_widget.dart';

class ProviderRecipeWidget extends StatelessWidget {
  final RecipeModel recipe;

  const ProviderRecipeWidget({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ProviderRecipePictureWidget(
              imagePath: recipe.imgPath,
            ),
            ProviderRecipeInfoWidget(
              recipe: recipe,
            ),
            const Spacer(),
            ProviderRecipeFavoriteButtonWidget(
              recipe: recipe,
            ),
          ],
        ),
        const Divider(height: 1),
      ],
    );
  }
}
