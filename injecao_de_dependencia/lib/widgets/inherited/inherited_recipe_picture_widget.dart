import 'package:flutter/material.dart';

class InheritedRecipePictureWidget extends StatelessWidget {
  final String imagePath;
  const InheritedRecipePictureWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
      width: width * 0.4,
      height: width * 0.3,
    );
  }
}
