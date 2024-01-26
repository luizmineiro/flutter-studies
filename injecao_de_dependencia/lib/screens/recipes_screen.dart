import 'package:flutter/material.dart';


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
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Container(),
    );
  }
}
