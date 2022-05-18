import 'package:cuidapet_api/entities/item.dart';

abstract class IItemsRepository {
  Future<List<Item>> findAll();
}
