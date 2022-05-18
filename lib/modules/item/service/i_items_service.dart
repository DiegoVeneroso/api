import 'package:cuidapet_api/entities/item.dart';

abstract class IItemsService {
  Future<List<Item>> findAll();
}
