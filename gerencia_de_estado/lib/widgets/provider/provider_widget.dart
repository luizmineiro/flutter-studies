import 'package:flutter/material.dart';
import 'package:gerencia_de_estado/controllers/provider/provider_controller.dart';
import 'package:provider/provider.dart';

import 'home_provider_stack_widget.dart';

class ProviderWidget extends StatelessWidget {
  const ProviderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ProviderController(),
      child: HomeProviderStackWidget(),
    );
  }
}
