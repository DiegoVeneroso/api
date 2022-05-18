import 'package:cuidapet_api/entities/item.dart';
import 'package:cuidapet_api/modules/item/data/i_items_repository.dart';
import 'package:cuidapet_api/modules/item/service/i_items_service.dart';
import 'package:injectable/injectable.dart';

import './i_items_service.dart';

@LazySingleton(as: IItemsService)
class ItemsService implements IItemsService {
  IItemsRepository repository;

  ItemsService({
    required this.repository,
  });

  @override
  Future<List<Item>> findAll() => repository.findAll();
}
