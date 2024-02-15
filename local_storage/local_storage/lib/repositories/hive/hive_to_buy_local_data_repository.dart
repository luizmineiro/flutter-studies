import 'package:hive/hive.dart';
import 'package:local_storage/erros/exeptions.dart';
import 'package:local_storage/models/hive_to_buy_model.dart';

const TO_BUY_LIST_BOX = "TO_BUY_LIST_BOX";

class HiveToBuyLocalDataRepository {
  Future<List<HiveToBuyModel>> loadToBuyList() async {
    try {
      final toBuyListBox = await getCollectionBox();

      return toBuyListBox.values.toList();
    } catch (_) {
      throw RepositoryExeptions(message: "Erro ao carregar a lista");
    }
  }

  Future<Box<HiveToBuyModel>> getCollectionBox() async {
    return await Hive.openBox(TO_BUY_LIST_BOX);
  }

  Future<void> addToBuyItem(HiveToBuyModel toBuy) async {
    try {
      final toBuyListBox = await getCollectionBox();

      await toBuyListBox.put(toBuy.id, toBuy);
    } catch (_) {
      throw RepositoryExeptions(
          message: "Erro ao adicionar item na lista de compras");
    }
  }

  Future<void> removeToBuyItem(String toBuyId) async {
    try {
      final toBuyListBox = await getCollectionBox();

      await toBuyListBox.delete(toBuyId);
    } catch (_) {
      throw RepositoryExeptions(message: "Erro ao remover item da lista");
    }
  }
}
