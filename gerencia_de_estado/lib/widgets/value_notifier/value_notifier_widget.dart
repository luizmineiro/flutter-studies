import 'package:flutter/material.dart';
import 'package:gerencia_de_estado/constants/colors_const.dart';
import 'package:gerencia_de_estado/controllers/value_notifier/value_notifier_controller.dart';
import 'package:gerencia_de_estado/shared/widgets/circulo_colorido_widget.dart';

class ValueNotifierWidget extends StatelessWidget {
  const ValueNotifierWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final valueNotifierCtlr = ValueNotifierController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          ValueListenableBuilder(
            valueListenable: valueNotifierCtlr.colorNotifier,
            builder: (_, Color color, __) {
              return Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                color: color,
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
                        onTap: () => valueNotifierCtlr.mudarCor(color),
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
