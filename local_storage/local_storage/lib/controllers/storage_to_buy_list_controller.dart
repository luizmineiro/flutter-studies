import 'package:flutter/material.dart';
import 'package:local_storage/erros/exeptions.dart';
import 'package:local_storage/models/to_buy_model.dart';
import 'package:uuid/uuid.dart';

import '../repositories/shared_preferences/shared_preferences_to_buy_local_data_repository.dart';

class StorageToBuyListController extends ChangeNotifier {
  final SharedPreferencesToBuyLocalDataRepository
      sharedPreferencesToBuyLocalDataRepository;

  StorageToBuyListController(this.sharedPreferencesToBuyLocalDataRepository) {
    onLoadToBuyList();
  }

  final List<ToBuyModel> toBuyList = [];

  String? erro;

  Future<void> onLoadToBuyList() async {
    try {
      toBuyList.addAll(
        await sharedPreferencesToBuyLocalDataRepository.loadToBuyList(),
      );
      notifyListeners();
    } on RepositoryExeptions catch (sharedPreferencesErro) {
      erro = sharedPreferencesErro.message;
    } catch (_) {
      erro = "Erro ao tentar carregar lista de compras";
    }
  }

  Future<void> onDeleteToBuyItem(String id) async {
    try {
      toBuyList.removeWhere((ToBuyModel toBuyModel) => toBuyModel.id == id);
      notifyListeners();
      await sharedPreferencesToBuyLocalDataRepository.removeToBuyItem(id);
    } on RepositoryExeptions catch (sharedPreferencesErro) {
      erro = sharedPreferencesErro.message;
    } catch (_) {
      erro = "Erro ao tentar deletar item da lista de compras";
    }
  }

  Future<void> onAddToBuyItem(String title, String description) async {
    try {
      final itemToAdd = ToBuyModel(
        id: const Uuid().v4(),
        title: title,
        description: description,
      );
      toBuyList.add(itemToAdd);
      notifyListeners();
      await sharedPreferencesToBuyLocalDataRepository.addToBuyItem(itemToAdd);
    } on RepositoryExeptions catch (sharedPreferencesErro) {
      erro = sharedPreferencesErro.message;
    } catch (_) {
      erro = "Erro ao tentar adicionar item na lista de compras";
    }
  }
}
