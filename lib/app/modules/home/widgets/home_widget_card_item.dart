import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_pokedex/app/app_config.dart';

import '../../../models/model_item.dart';

class HomeWidgetCardItem extends StatelessWidget {
  const HomeWidgetCardItem({
    Key? key,
    this.item,
  }) : super(key: key);
  final ModelItem? item;
  @override
  Widget build(BuildContext context) {
    final String id = item!.url!.split('/')[6];
    final String imgUrl = '${AppConfig.basePngUrl}$id.png';
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: AppConfig.maxPageWidth,
        ),
        child: Card(
          margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: ListTile(
            onTap: () {
              Modular.to.pushNamed('/profile/$id');
            },
            contentPadding: const EdgeInsets.all(12),
            trailing: Text(id),
            leading: SizedBox(
              width: 80,
              height: 100,
              child: Image.network(
                imgUrl,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(item!.name!),
          ),
        ),
      ),
    );
  }
}
