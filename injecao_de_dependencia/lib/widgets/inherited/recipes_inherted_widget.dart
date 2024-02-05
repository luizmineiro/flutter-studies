import 'package:flutter/material.dart';
import 'package:injecao_de_dependencia/controllers/recipes_controller.dart';

class RecipesInhertedWidget extends InheritedWidget {
  final RecipesController recipesController;
  const RecipesInhertedWidget({
    super.key,
    required this.recipesController,
    required this.child,
  }) : super(child: child);

  final Widget child;

  static RecipesInhertedWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<RecipesInhertedWidget>();
  }

  @override
  bool updateShouldNotify(RecipesInhertedWidget oldWidget) {
    return false;
  }
}
