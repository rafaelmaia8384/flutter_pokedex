import 'package:flutter_modular/flutter_modular.dart';

import '../profile/profile_store.dart';

import 'profile_page.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProfileStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/:pokeId',
      child: (_, args) => ProfilePage(
        id: args.params['pokeId'],
      ),
    ),
  ];
}
