import 'dart:convert';

import 'package:local_storage/erros/exeptions.dart';
import 'package:local_storage/models/to_buy_model.dart';
import 'package:local_storage/repositories/to_buy_local_data_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

const TO_BUY_LIST_KEY = 'TO_BUY_LIST_KEY';

class SharedPreferencesToBuyLocalDataRepository
    implements ToBuyLocalDataRepository {
  @override
  Future<List<ToBuyModel>> loadToBuyList() async {
    try {
      //* pegar a instancia do Shared Preferences
      final prefs = await SharedPreferences.getInstance();
      //* carregar o JSON da lista se existir
      final toBuyListJSON = prefs.getString(TO_BUY_LIST_KEY);
      //*criar uma lista de que será retornada
      final listToReturn = <ToBuyModel>[];
      //* checar se o JSON existe
      if (toBuyListJSON != null) {
        //* transformaro JSON para List<Map<String, dynamic>>
        final toBuyDecoded = jsonDecode(toBuyListJSON);
        //* transformar o List<Map<String, dynamic>> para List<ToBuyModel>
        final toBuyList = (toBuyDecoded as List)
            .map((toBuy) => ToBuyModel.fromMap(toBuy))
            .toList();

        //* adicionar todos os item na lista de retorno
        listToReturn.addAll(toBuyList);
      }
      return listToReturn;
    } catch (_) {
      throw RepositoryExeptions(message: "Erro ao carregar lista de compras");
    }
  }

  @override
  Future<void> addToBuyItem(ToBuyModel buyModel) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      //* carregar a lista
      final List<ToBuyModel> toBuyList = await loadToBuyList();
      //* adicionar item na lista
      toBuyList.add(buyModel);
      //* transformar a lista para List<Map<String, dynamic>>
      final toBuyListMap = toBuyList.map((toBuy) => toBuy.toMap()).toList();
      //* transformar a List<Map<String, dynamic>> em JSON
      final toBuyListJSON = jsonEncode(toBuyListMap);
      //* Salvar a nova lista
      prefs.setString(TO_BUY_LIST_KEY, toBuyListJSON);
    } catch (_) {
      throw RepositoryExeptions(
          message: "Erro ao adicionar item na lista de compras");
    }
  }

  @override
  Future<void> removeToBuyItem(String toBuyId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final List<ToBuyModel> toBuyList = await loadToBuyList();
      toBuyList.removeWhere((toBuy) => toBuy.id == toBuyId);
      final toBuyListMap = toBuyList.map((toBuy) => toBuy.toMap()).toList();
      final toBuyListJSON = jsonEncode(toBuyListMap);
      prefs.setString(TO_BUY_LIST_KEY, toBuyListJSON);

    } catch (_) {
      throw RepositoryExeptions(message: "Erro ao remover item da lista");
    }
  }
}
