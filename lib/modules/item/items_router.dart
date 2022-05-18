import 'package:cuidapet_api/application/routers/i_router.dart';
import 'package:cuidapet_api/modules/item/controller/items_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:shelf_router/src/router.dart';

class ItemsRouter implements IRouter {
  @override
  void configure(Router router) {
    final itemController = GetIt.I.get<ItemsController>();
    router.mount('/items/', itemController.router);
  }
}
