import 'package:flutter/material.dart';

class HomeMediaQueryScreen extends StatelessWidget {
  const HomeMediaQueryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Aplicativo Responsivo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: width < 650
            ? Column(
                children: [
                  Container(
                    color: Colors.deepOrangeAccent,
                    width: width * 0.9,
                    height: width * 0.9,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Nam sodales, urna ac vehicula venenatis, sapien orci porta dolor, ut molestie eros arcu ac tellus. Duis suscipit sapien velit.",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              )
            : Row(
                children: [
                  Container(
                    color: Colors.deepOrangeAccent,
                    width: width * 0.6,
                    height: width * 0.6,
                  ),
                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      "Nam sodales, urna ac vehicula venenatis, sapien orci porta dolor, ut molestie eros arcu ac tellus. Duis suscipit sapien velit.",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
