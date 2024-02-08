import 'package:local_storage/models/to_buy_model.dart';

abstract interface class ToBuyLocalDataRepository {
  /// Carregar a lista de compras
  Future<List<ToBuyModel>> loadToBuyList();

  /// Adicionar um item na lista de compras
  Future<void> addToBuyItem(ToBuyModel buyModel);

  /// Remover um item da lista de compras
  Future<void> removeToBuyItem(String toBuyId);
}
