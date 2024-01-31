import 'package:flutter/material.dart';

class RecipeModel {
  final int id;
  final String name;
  final String imgPath;
  final int calories;
  final String prepTime;
  final ValueNotifier<bool> isFavorite;

  RecipeModel({
    required this.id,
    required this.name,
    required this.imgPath,
    required this.calories,
    required this.prepTime,
    required this.isFavorite,
  });
}
