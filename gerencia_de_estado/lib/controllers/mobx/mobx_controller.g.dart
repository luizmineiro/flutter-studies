// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mobx_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MobxController on MobxControllerBase, Store {
  Computed<Color>? _$getColorComputed;

  @override
  Color get getColor =>
      (_$getColorComputed ??= Computed<Color>(() => super.getColor,
              name: 'MobxControllerBase.getColor'))
          .value;

  late final _$_colorAtom =
      Atom(name: 'MobxControllerBase._color', context: context);

  @override
  Color get _color {
    _$_colorAtom.reportRead();
    return super._color;
  }

  @override
  set _color(Color value) {
    _$_colorAtom.reportWrite(value, super._color, () {
      super._color = value;
    });
  }

  late final _$MobxControllerBaseActionController =
      ActionController(name: 'MobxControllerBase', context: context);

  @override
  void mudarCor(Color color) {
    final _$actionInfo = _$MobxControllerBaseActionController.startAction(
        name: 'MobxControllerBase.mudarCor');
    try {
      return super.mudarCor(color);
    } finally {
      _$MobxControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getColor: ${getColor}
    ''';
  }
}
