import 'package:flutter/material.dart';
import 'package:gerencia_de_estado/constants/colors_const.dart';

class ProviderController extends ChangeNotifier {
  Color _color = kColors.first;

  Color get getColor => _color;

  void mudarCor(Color color) {
    _color = color;
    notifyListeners();
  }
}
