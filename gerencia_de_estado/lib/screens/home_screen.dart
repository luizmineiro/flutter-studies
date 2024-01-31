import 'package:flutter/material.dart';

import '../widgets/getx/home_getx_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Satate Management App'),
      ),
      body: const HomeGetxWidget(),
    );
  }
}
