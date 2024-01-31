import 'package:flutter/material.dart';
import 'package:gerencia_de_estado/controllers/getx/getx_controller.dart';
import 'package:get/get.dart';

import '../../constants/colors_const.dart';
import '../../shared/widgets/circulo_colorido_widget.dart';

class HomeGetxWidget extends StatelessWidget {
  const HomeGetxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final getxCtrl = GetController();
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Obx(
          () {
            return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: getxCtrl.getColor,
            );
          },
        ),
        Positioned(
          bottom: 20,
          child: Row(
            children: kColors
                .map(
                  (Color color) => Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: CirculoColoridoWidget(
                      onTap: () => getxCtrl.mudarCor(color),
                      color: color,
                    ),
                  ),
                )
                .toList(),
          ),
        )
      ],
    );
  }
}
