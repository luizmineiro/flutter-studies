import 'package:flutter/material.dart';
import 'package:gerencia_de_estado/constants/colors_const.dart';

class ValueNotifierController {
  final colorNotifier = ValueNotifier<Color>(kColors.first);

  void mudarCor(Color color){
    colorNotifier.value = color;
  }

  Color get getColor => colorNotifier.value;
}
