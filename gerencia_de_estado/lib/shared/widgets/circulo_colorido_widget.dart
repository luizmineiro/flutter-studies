import 'package:flutter/material.dart';

class CirculoColoridoWidget extends StatelessWidget {
  final void Function() onTap;
  final Color color;
  const CirculoColoridoWidget({
    super.key,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.white, width: 2),
        ),
      ),
    );
  }
}
