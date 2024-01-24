import 'package:flutter/material.dart';
import 'package:gerencia_de_estado/widgets/value_notifier/value_notifier_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Satate Management App'),
      ),
      body: const ValueNotifierWidget(),
    );
  }
}
