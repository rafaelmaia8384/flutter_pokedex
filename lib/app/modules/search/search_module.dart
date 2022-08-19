import 'package:flutter_modular/flutter_modular.dart';

import 'search_page.dart';
import 'search_store.dart';

class SearchModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => SearchStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/:pokeName',
      child: (_, args) => SearchPage(
        pokeName: args.params['pokeName'],
      ),
    ),
  ];
}
