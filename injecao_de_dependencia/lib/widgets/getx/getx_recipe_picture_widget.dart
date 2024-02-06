import 'package:flutter/material.dart';

class GetxRecipePictureWidget extends StatelessWidget {
  final String imagePath;
  const GetxRecipePictureWidget({super.key, required this.imagePath});

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
