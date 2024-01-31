import 'package:flutter/material.dart';

import '../models/recipe_model.dart';

final kRecipes = <RecipeModel>[
  RecipeModel(
    id: 1,
    name: 'Nhoque de Batata',
    imgPath: 'assets/images/recipes/gnocchi.jpg',
    calories: 700,
    prepTime: '1 hora 20 min',
    isFavorite: ValueNotifier(false),
  ),
  RecipeModel(
    id: 2,
    name: 'Pudim',
    imgPath: 'assets/images/recipes/pudding.jpg',
    calories: 200,
    prepTime: '30 min',
    isFavorite: ValueNotifier(false),
  ),
  RecipeModel(
    id: 3,
    name: 'Ovos Mexidos',
    imgPath: 'assets/images/recipes/scrabled-eggs.jpg',
    calories: 160,
    prepTime: '15 min',
    isFavorite: ValueNotifier(false),
  ),
  RecipeModel(
    id: 4,
    name: 'Sopa de vegetais',
    imgPath: 'assets/images/recipes/vegetables-soup.jpg',
    calories: 200,
    prepTime: '45 min',
    isFavorite: ValueNotifier(false),
  ),
  RecipeModel(
    id: 5,
    name: 'Bolo de Cenoura',
    imgPath: 'assets/images/recipes/carrot-cake.jpg',
    calories: 415,
    prepTime: '40 min',
    isFavorite: ValueNotifier(false),
  ),
  RecipeModel(
    id: 6,
    name: 'Brigadeiro',
    imgPath: 'assets/images/recipes/brigadeiro.jpg',
    calories: 33,
    prepTime: '15 min',
    isFavorite: ValueNotifier(false),
  ),
];
