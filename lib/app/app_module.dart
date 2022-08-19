import 'package:flutter_modular/flutter_modular.dart';

import 'app_store.dart';
import 'modules/home/home_module.dart';
import 'modules/home/home_store.dart';
import 'modules/profile/profile_module.dart';
import 'modules/profile/profile_store.dart';
import 'modules/search/search_module.dart';
import 'modules/search/search_store.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AppStore()),
    Bind.lazySingleton((i) => HomeStore()),
    Bind.lazySingleton((i) => SearchStore()),
    Bind.lazySingleton((i) => ProfileStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      Modular.initialRoute,
      module: HomeModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/search',
      module: SearchModule(),
      transition: TransitionType.fadeIn,
    ),
    ModuleRoute(
      '/profile',
      module: ProfileModule(),
      transition: TransitionType.fadeIn,
    ),
  ];
}
