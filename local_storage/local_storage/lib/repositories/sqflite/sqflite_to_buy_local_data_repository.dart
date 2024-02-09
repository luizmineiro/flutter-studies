import 'package:local_storage/erros/exeptions.dart';
import 'package:local_storage/models/to_buy_model.dart';
import 'package:local_storage/repositories/to_buy_local_data_repository.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const TO_BUY_DB_NAME = 'tobuy.db';
const TO_BUY_TABLE_NAME = 'tobuylist';

class SqfliteToBuyLocalDataRepository implements ToBuyLocalDataRepository {
  Database? db;

  Future<void> loadDb() async {
    if (db == null) {
      //* pagar caminho ate o database
      var databasePath = await getDatabasesPath();
      final path = join(databasePath, TO_BUY_DB_NAME);
      db = await openDatabase(
        path,
        version: 1,
        onCreate: (Database database, int version) async {
          await database.execute(
            """
          CREATE TABLE $TO_BUY_TABLE_NAME(
            id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
            title TEXT,
            description TEXT
          )
          """,
          );
        },
      );
    }
  }

  @override
  Future<List<ToBuyModel>> loadToBuyList() async {
    try {
      await loadDb();
      //* pegar todos os itens da tabela
      final toBuyMapList = await db?.rawQuery("""
        SELECT * FROM $TO_BUY_TABLE_NAME
      """);
      //* criar uma lista que sera retornada
      final listToReturn = <ToBuyModel>[];
      if (toBuyMapList != null) {
        final toBuyList = toBuyMapList
            .map(
              (toBuy) => ToBuyModel.fromMapToSQL(toBuy),
            )
            .toList();

        listToReturn.addAll(toBuyList);
      }
      return listToReturn;
    } catch (_) {
      throw RepositoryExeptions(message: "Erro ao carregar a lista de compras");
    }
  }

  @override
  Future<void> addToBuyItem(ToBuyModel buyModel) async {
    try {
      await db?.rawInsert("""
        INSERT INTO $TO_BUY_TABLE_NAME(title, description) VALUES('${buyModel.title}', '${buyModel.description}')
      """);
    } catch (_) {
      throw RepositoryExeptions(
        message: "Erro ao adicionar item na lista de compras",
      );
    }
  }

  @override
  Future<void> removeToBuyItem(String toBuyId) async {
    try {
      await db?.rawDelete(
        """
        DELETE FROM $TO_BUY_TABLE_NAME WHERE id = ? 
      """,
        [toBuyId],
      );
    } catch (_) {
      throw RepositoryExeptions(
          message: "Erro ao deletar um item da list de compras");
    }
  }
}
