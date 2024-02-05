import 'package:flutter/material.dart';
import 'package:injecao_de_dependencia/controllers/recipes_controller.dart';
import 'package:injecao_de_dependencia/screens/inherited_screen/inherited_recipes_screen.dart';
import 'package:injecao_de_dependencia/screens/recipes_screen.dart';
import 'package:injecao_de_dependencia/widgets/inherited/recipes_inherted_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: RecipesInhertedWidget(
        recipesController: RecipesController(),
        child: const InheritedRecipesScreen(),
      ),
    );
  }
}
