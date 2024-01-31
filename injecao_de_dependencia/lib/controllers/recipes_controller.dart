import 'package:injecao_de_dependencia/models/recipe_model.dart';

import '../const/recipes_const.dart';

class RecipesController {
  final List<RecipeModel> recipes = kRecipes;

  void markAsFavorite(int recipeId, bool isFavorite) {
    final RecipeModel recipe =
        recipes.firstWhere((recipe) => recipe.id == recipeId);

    recipe.isFavorite.value = isFavorite;
  }
}
