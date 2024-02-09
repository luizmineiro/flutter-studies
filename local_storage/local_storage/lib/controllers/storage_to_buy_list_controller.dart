import 'package:flutter/material.dart';
import 'package:local_storage/erros/exeptions.dart';
import 'package:local_storage/models/to_buy_model.dart';
import 'package:local_storage/repositories/sqflite/sqflite_to_buy_Local_data_repository.dart';
import 'package:uuid/uuid.dart';

import '../repositories/shared_preferences/shared_preferences_to_buy_local_data_repository.dart';

class StorageToBuyListController extends ChangeNotifier {
  final SqfliteToBuyLocalDataRepository toBuyLocalDataRepository;

  StorageToBuyListController(this.toBuyLocalDataRepository) {
    onLoadToBuyList();
  }

  final List<ToBuyModel> toBuyList = [];

  String? erro;

  Future<void> onLoadToBuyList() async {
    try {
      toBuyList.addAll(
        await toBuyLocalDataRepository.loadToBuyList(),
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
      await toBuyLocalDataRepository.removeToBuyItem(id);
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
      await toBuyLocalDataRepository.addToBuyItem(itemToAdd);
    } on RepositoryExeptions catch (sharedPreferencesErro) {
      erro = sharedPreferencesErro.message;
    } catch (_) {
      erro = "Erro ao tentar adicionar item na lista de compras";
    }
  }
}
