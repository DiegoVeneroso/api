import 'package:cuidapet_api/application/exceptions/database_exception.dart';
import 'package:cuidapet_api/entities/item.dart';
import 'package:injectable/injectable.dart';
import 'package:cuidapet_api/application/database/i_database_connection.dart';
import 'package:cuidapet_api/application/logger/i_logger.dart';
import 'package:mysql1/mysql1.dart';

import 'i_items_repository.dart';

@LazySingleton(as: IItemsRepository)
class ItemsRepository implements IItemsRepository {
  IDatabaseConnection connection;
  ILogger log;
  ItemsRepository({
    required this.connection,
    required this.log,
  });

  @override
  Future<List<Item>> findAll() async {
    MySqlConnection? conn;

    try {
      conn = await connection.openConnection();
      final result = await conn.query('select * from items');

      if (result.isNotEmpty) {
        return result
            .map(
              (e) => Item(
                  id: e['id'],
                  title: e['title'],
                  subtitle: e['subtitle'],
                  description: e['description']),
            )
            .toList();
      }

      return [];
    } on MySqlException catch (e, s) {
      log.error('Erro ao buscar as item', e, s);
      throw DatabaseException();
    } finally {
      await conn?.close();
    }
  }
}
