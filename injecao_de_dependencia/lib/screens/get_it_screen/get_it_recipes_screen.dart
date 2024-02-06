import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:injecao_de_dependencia/controllers/recipes_controller.dart';

import '../../widgets/get_it/get_it_recipe_widget.dart';
/*
  *A injeção de dependencia é uma teccnica de programação que permite gerenciar dependencias de forma clara e desacoplada
  *Em vez de uma classe criar suas proprias dependencias elas são fornecidas externamente 
  *No flutter a injeção de dependencia é muito usada para fornecer serviços, como conexão com a internet ou armazenamento local para widgets
  *Isso ajuda a manter o codigo limpo e organizado, tornando mais facil a manutenção do app 
*/

class GetItRecipesScreen extends StatelessWidget {
  const GetItRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final getIt = GetIt.instance;

    getIt.registerLazySingleton(() => RecipesController());

    final recipesCtrl = getIt.get<RecipesController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Receitas'),
      ),
      body: ListView.builder(
        itemCount: recipesCtrl.recipes.length,
        itemBuilder: (context, index) {
          return GetItRecipeWidget(
            recipe: recipesCtrl.recipes[index],
          );
        },
      ),
    );
  }
}
