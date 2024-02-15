import 'package:local_storage/models/to_buy_model.dart';

import '../models/hive_to_buy_model.dart';

abstract interface class ToBuyLocalDataRepository {
  /// Carregar a lista de compras
  Future<List<HiveToBuyModel>> loadToBuyList();

  /// Adicionar um item na lista de compras
  Future<void> addToBuyItem(HiveToBuyModel buyModel);

  /// Remover um item da lista de compras
  Future<void> removeToBuyItem(String toBuyId);
}
