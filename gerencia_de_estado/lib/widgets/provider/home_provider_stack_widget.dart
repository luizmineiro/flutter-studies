import 'package:flutter/material.dart';
import 'package:gerencia_de_estado/controllers/provider/provider_controller.dart';
import 'package:provider/provider.dart';

import '../../constants/colors_const.dart';
import '../../shared/widgets/circulo_colorido_widget.dart';

class HomeProviderStackWidget extends StatelessWidget {
  const HomeProviderStackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final providerCtrl = Provider.of<ProviderController>(context);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          color: providerCtrl.getColor,
        ),
        Positioned(
          bottom: 20,
          child: Row(
            children: kColors
                .map(
                  (Color color) => Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: CirculoColoridoWidget(
                      onTap: () => providerCtrl.mudarCor(color),
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
