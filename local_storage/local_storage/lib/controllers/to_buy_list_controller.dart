import 'package:flutter/material.dart';
import 'package:local_storage/models/to_buy_model.dart';
import 'package:uuid/uuid.dart';

import '../models/hive_to_buy_model.dart';

class ToBuyListController extends ChangeNotifier {
  final List<HiveToBuyModel> toBuyList = [];

  void onDeleteToBuyItem(String id) {
    toBuyList.removeWhere((HiveToBuyModel toBuyModel) => toBuyModel.id == id);
    notifyListeners();
  }

  void onAddToBuyItem(String title, String description) {
    toBuyList.add(HiveToBuyModel(
      id: const Uuid().v4(),
      title: title,
      description: description,
    ));
    notifyListeners();
  }
}
