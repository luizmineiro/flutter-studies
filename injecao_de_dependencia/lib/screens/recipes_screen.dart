import 'package:flutter/material.dart';
import 'package:injecao_de_dependencia/controllers/recipes_controller.dart';

import '../widgets/recipe_widget.dart';

/*
  *A injeção de dependencia é uma teccnica de programação que permite gerenciar dependencias de forma clara e desacoplada
  *Em vez de uma classe criar suas proprias dependencias elas são fornecidas externamente 
  *No flutter a injeção de dependencia é muito usada para fornecer serviços, como conexão com a internet ou armazenamento local para widgets
  *Isso ajuda a manter o codigo limpo e organizado, tornando mais facil a manutenção do app 
*/

class RecipesScreen extends StatelessWidget {
  const RecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recipesCtrl = RecipesController();
    final recipes = recipesCtrl.recipes;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Receitas'),
      ),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return RecipeWidget(
            recipe: recipes[index],
            recipesCtrl: recipesCtrl,
          );
        },
      ),
    );
  }
}
