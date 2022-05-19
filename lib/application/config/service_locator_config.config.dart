// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../modules/categories/controller/categories_controller.dart' as _i37;
import '../../modules/categories/data/categories_repository.dart' as _i27;
import '../../modules/categories/data/i_categories_repository.dart' as _i26;
import '../../modules/categories/service/categories_service.dart' as _i29;
import '../../modules/categories/service/i_categories_service.dart' as _i28;
import '../../modules/chat/controller/chat_controller.dart' as _i38;
import '../../modules/chat/data/chat_repository.dart' as _i31;
import '../../modules/chat/data/i_chat_repository.dart' as _i30;
import '../../modules/chat/service/chat_service.dart' as _i33;
import '../../modules/chat/service/i_chat_service.dart' as _i32;
import '../../modules/item/controller/items_controller.dart' as _i21;
import '../../modules/item/data/i_items_repository.dart' as _i6;
import '../../modules/item/data/items_repository.dart' as _i7;
import '../../modules/item/service/i_items_service.dart' as _i9;
import '../../modules/item/service/items_service.dart' as _i10;
import '../../modules/schedules/controller/schedule_controller.dart' as _i23;
import '../../modules/schedules/data/i_schedule_repository.dart' as _i11;
import '../../modules/schedules/data/schedule_repository.dart' as _i12;
import '../../modules/schedules/service/i_schedule_service.dart' as _i13;
import '../../modules/schedules/service/schedule_service.dart' as _i14;
import '../../modules/supplier/controller/supplier_controller.dart' as _i36;
import '../../modules/supplier/data/i_supplier_repository.dart' as _i15;
import '../../modules/supplier/data/supplier_repository.dart' as _i16;
import '../../modules/supplier/service/i_supplier_service.dart' as _i34;
import '../../modules/supplier/service/supplier_service.dart' as _i35;
import '../../modules/user/controller/auth_controller.dart' as _i25;
import '../../modules/user/controller/user_controller.dart' as _i24;
import '../../modules/user/data/i_user_repository.dart' as _i17;
import '../../modules/user/data/user_repository.dart' as _i18;
import '../../modules/user/service/i_user_service.dart' as _i19;
import '../../modules/user/service/user_service.dart' as _i20;
import '../database/database_connection.dart' as _i4;
import '../database/i_database_connection.dart' as _i3;
import '../facades/push_notification_facade.dart' as _i22;
import '../logger/i_logger.dart' as _i8;
import 'database_connection_configuration.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.lazySingleton<_i3.IDatabaseConnection>(
      () => _i4.DatabaseConnection(get<_i5.DatabaseConnectionConfiguration>()));
  gh.lazySingleton<_i6.IItemsRepository>(() => _i7.ItemsRepository(
      connection: get<_i3.IDatabaseConnection>(), log: get<_i8.ILogger>()));
  gh.lazySingleton<_i9.IItemsService>(
      () => _i10.ItemsService(repository: get<_i6.IItemsRepository>()));
  gh.lazySingleton<_i11.IScheduleRepository>(() => _i12.ScheduleRepository(
      connection: get<_i3.IDatabaseConnection>(), log: get<_i8.ILogger>()));
  gh.lazySingleton<_i13.IScheduleService>(
      () => _i14.ScheduleService(repository: get<_i11.IScheduleRepository>()));
  gh.lazySingleton<_i15.ISupplierRepository>(() => _i16.SupplierRepository(
      connection: get<_i3.IDatabaseConnection>(), log: get<_i8.ILogger>()));
  gh.lazySingleton<_i17.IUserRepository>(() => _i18.UserRepository(
      connection: get<_i3.IDatabaseConnection>(), log: get<_i8.ILogger>()));
  gh.lazySingleton<_i19.IUserService>(() => _i20.UserService(
      userRepository: get<_i17.IUserRepository>(), log: get<_i8.ILogger>()));
  gh.factory<_i21.ItemsController>(
      () => _i21.ItemsController(service: get<_i9.IItemsService>()));
  gh.lazySingleton<_i22.PushNotificationFacade>(
      () => _i22.PushNotificationFacade(log: get<_i8.ILogger>()));
  gh.factory<_i23.ScheduleController>(() => _i23.ScheduleController(
      service: get<_i13.IScheduleService>(), log: get<_i8.ILogger>()));
  gh.factory<_i24.UserController>(() => _i24.UserController(
      userService: get<_i19.IUserService>(), log: get<_i8.ILogger>()));
  gh.factory<_i25.AuthController>(() => _i25.AuthController(
      userService: get<_i19.IUserService>(), log: get<_i8.ILogger>()));
  gh.lazySingleton<_i26.ICategoriesRepository>(() => _i27.CategoriesRepository(
      connection: get<_i3.IDatabaseConnection>(), log: get<_i8.ILogger>()));
  gh.lazySingleton<_i28.ICategoriesService>(() =>
      _i29.CategoriesService(repository: get<_i26.ICategoriesRepository>()));
  gh.lazySingleton<_i30.IChatRepository>(() => _i31.ChatRepository(
      connection: get<_i3.IDatabaseConnection>(), log: get<_i8.ILogger>()));
  gh.lazySingleton<_i32.IChatService>(() => _i33.ChatService(
      repository: get<_i30.IChatRepository>(),
      pushNotificationFacade: get<_i22.PushNotificationFacade>()));
  gh.lazySingleton<_i34.ISupplierService>(() => _i35.SupplierService(
      repository: get<_i15.ISupplierRepository>(),
      userService: get<_i19.IUserService>()));
  gh.factory<_i36.SupplierController>(() => _i36.SupplierController(
      service: get<_i34.ISupplierService>(), log: get<_i8.ILogger>()));
  gh.factory<_i37.CategoriesController>(
      () => _i37.CategoriesController(service: get<_i28.ICategoriesService>()));
  gh.factory<_i38.ChatController>(() => _i38.ChatController(
      service: get<_i32.IChatService>(), log: get<_i8.ILogger>()));
  return get;
}
