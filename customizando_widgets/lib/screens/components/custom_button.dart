import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final void Function() onPress;
  const CustomButton({super.key, required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black87,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: const BorderSide(color: Colors.white),
          ),
          padding: const EdgeInsets.all(18)),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 2.0,
        ),
      ),
    );
  }
}
