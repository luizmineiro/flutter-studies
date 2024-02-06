import 'package:flutter/material.dart';

import '../../models/recipe_model.dart';
import 'inherited_recipe_favorite_button_widget.dart';
import 'inherited_recipe_info_widget.dart';
import 'inherited_recipe_picture_widget.dart';

class InheritedRecipeWidget extends StatelessWidget {
  final RecipeModel recipe;

  const InheritedRecipeWidget({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            InheritedRecipePictureWidget(
              imagePath: recipe.imgPath,
            ),
            InheritedRecipeInfoWidget(
              recipe: recipe,
            ),
            const Spacer(),
            InheritedRecipeFavoriteButtonWidget(
              recipe: recipe,
            ),
          ],
        ),
        const Divider(height: 1),
      ],
    );
  }
}
