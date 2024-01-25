import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gerencia_de_estado/controllers/mobx/mobx_controller.dart';

import '../../constants/colors_const.dart';
import '../../shared/widgets/circulo_colorido_widget.dart';

class HomeMobxWidget extends StatelessWidget {
  const HomeMobxWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mobxCtrl = MobxController();
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Observer(
          builder: (context) {
            return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: mobxCtrl.getColor,
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
                      onTap: () => mobxCtrl.mudarCor(color),
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
