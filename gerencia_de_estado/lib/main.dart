import 'package:flutter/material.dart';
import 'package:gerencia_de_estado/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

/*
  Gerencia de Estado -> É a maneiro que gerenciamos e atualizamos os dados da view
*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}