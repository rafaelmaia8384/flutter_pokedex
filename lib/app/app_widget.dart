import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_config.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Desafio Pokédex',
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      debugShowCheckedModeBanner: false,
      theme: AppConfig.getThemeData(),
    );
  }
}
