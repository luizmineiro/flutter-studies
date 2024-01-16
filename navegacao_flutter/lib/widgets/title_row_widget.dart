import 'package:flutter/material.dart';

class TitleRowWidget extends StatelessWidget {
  final String title;
  final String labelButton;
  final void Function() onPressButton;
  const TitleRowWidget({
    super.key,
    required this.title,
    required this.labelButton,
    required this.onPressButton,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: onPressButton,
            child: Text(labelButton),
          ),
        ],
      ),
    );
  }
}
