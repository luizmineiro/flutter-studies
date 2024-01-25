import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../constants/colors_const.dart';

//* Criar um part que vai ser o arquivo gerado pelo build_runner
//* para gera o codigo -> "flutter pub run build_runner build"
part 'mobx_controller.g.dart';

class MobxController = MobxControllerBase with _$MobxController;

//* Ele serve pra receber um codigo gerrenciado que vai ser baseado no MobXController
abstract class MobxControllerBase with Store {
  @observable
  Color _color = kColors.first;

  @computed
  Color get getColor => _color;

  @action
  void mudarCor(Color color) {
    _color = color;
  }
}
