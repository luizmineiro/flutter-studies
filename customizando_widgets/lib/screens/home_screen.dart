import 'package:customizando_widgets/screens/components/custom_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _contador = 0;
  void _somarUm() {
    setState(() {
      _contador++;
    });
  }

  void _subtrairUm() {
    setState(() {
      _contador--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _contador.toString(),
              style: const TextStyle(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  title: "Subtrair",
                  onPress: _subtrairUm,
                ),
                const SizedBox(width: 14),
                CustomButton(
                  title: "Somar",
                  onPress: _somarUm,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
