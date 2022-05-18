import 'dart:async';
import 'dart:convert';

import 'package:cuidapet_api/modules/item/service/i_items_service.dart';
import 'package:injectable/injectable.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'items_controller.g.dart';

@Injectable()
class ItemsController {
  IItemsService service;

  ItemsController({
    required this.service,
  });

  @Route.get('/')
  Future<Response> findAll(Request request) async {
    try {
      final items = await service.findAll();
      final itemsResponse = items
          .map((e) => {
                'id': e.id,
                'title': e.title,
                'subtitle': e.subtitle,
                'description': e.description,
              })
          .toList();

      return Response.ok(jsonEncode(itemsResponse));
    } catch (e) {
      return Response.internalServerError();
    }
  }

  Router get router => _$ItemsControllerRouter(this);
}
