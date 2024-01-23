import 'package:flutter/material.dart';

class HomeLayoutBuilderScreen extends StatelessWidget {
  const HomeLayoutBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text('Aplicativo Responsivo'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 650) {
                return Column(
                  children: [
                    Container(
                      color: Colors.deepOrangeAccent,
                      width: constraints.maxWidth,
                      height: constraints.maxWidth,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Nam sodales, urna ac vehicula venenatis, sapien orci porta dolor, ut molestie eros arcu ac tellus. Duis suscipit sapien velit.",
                      style: TextStyle(fontSize: 18),
                    ),
                  ],
                );
              } else {
                return Row(
                  children: [
                    Container(
                      color: Colors.deepOrangeAccent,
                      width: constraints.maxWidth * 0.6,
                      height: constraints.maxWidth * 0.6,
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        "Nam sodales, urna ac vehicula venenatis, sapien orci porta dolor, ut molestie eros arcu ac tellus. Duis suscipit sapien velit.",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
