import 'package:flutter/material.dart';
import 'package:injecao_de_dependencia/controllers/recipes_controller.dart';
import 'package:injecao_de_dependencia/widgets/inherited/recipes_inherted_widget.dart';

import '../../widgets/inherited/inherited_recipe_widget.dart';
/*
  *A injeção de dependencia é uma teccnica de programação que permite gerenciar dependencias de forma clara e desacoplada
  *Em vez de uma classe criar suas proprias dependencias elas são fornecidas externamente 
  *No flutter a injeção de dependencia é muito usada para fornecer serviços, como conexão com a internet ou armazenamento local para widgets
  *Isso ajuda a manter o codigo limpo e organizado, tornando mais facil a manutenção do app 
*/

class InheritedRecipesScreen extends StatelessWidget {
  const InheritedRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final recipesCtrl = RecipesInhertedWidget.of(context)!.recipesController;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Receitas'),
      ),
      body: ListView.builder(
        itemCount: recipesCtrl.recipes.length,
        itemBuilder: (context, index) {
          return InheritedRecipeWidget(
            recipe: recipesCtrl.recipes[index],
          );
        },
      ),
    );
  }
}
