import 'package:flutter/material.dart';
import 'package:gerencia_de_estado/constants/colors_const.dart';
import 'package:get/get.dart';

class GetController {
  final Rx<Color> _color = kColors.first.obs;

  Color get getColor => _color.value;

  void mudarCor(Color color) {
    _color.value = color;
  }
}
