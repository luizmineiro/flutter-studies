import 'package:flutter/material.dart';
import 'package:local_storage/models/to_buy_model.dart';
import 'package:uuid/uuid.dart';

class ToBuyListController extends ChangeNotifier {
  final List<ToBuyModel> toBuyList = [];

  void onDeleteToBuyItem(String id) {
    toBuyList.removeWhere((ToBuyModel toBuyModel) => toBuyModel.id == id);
    notifyListeners();
  }

  void onAddToBuyItem(String title, String description) {
    toBuyList.add(ToBuyModel(
      id: const Uuid().v4(),
      title: title,
      description: description,
    ));
    notifyListeners();
  }
}
