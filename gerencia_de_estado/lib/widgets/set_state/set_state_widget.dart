import 'package:flutter/material.dart';
import 'package:gerencia_de_estado/constants/colors_const.dart';
import 'package:gerencia_de_estado/shared/widgets/circulo_colorido_widget.dart';

class SetStateWidget extends StatefulWidget {
  const SetStateWidget({super.key});

  @override
  State<SetStateWidget> createState() => _SetStateWidgetState();
}

class _SetStateWidgetState extends State<SetStateWidget> {
  Color _selectedColor = kColors.first;
  void mudarACor(Color color) {
    setState(() {
      _selectedColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            color: _selectedColor,
          ),
          Positioned(
            bottom: 20,
            child: Row(
              children: kColors
                  .map(
                    (Color color) => Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: CirculoColoridoWidget(
                        onTap: () => mudarACor(color),
                        color: color,
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
