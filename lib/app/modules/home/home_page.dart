import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../app_config.dart';
import '../../app_store.dart';
import '../../models/model_item.dart';
import '../../widgets/app_widget_global_list.dart';
import 'home_repository.dart';
import 'home_store.dart';
import 'widgets/home_widget_card_item.dart';
import 'widgets/home_widget_page_empty.dart';
import 'widgets/home_widget_page_loading.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _homeStore = Modular.get<HomeStore>();
    final TextEditingController _searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Pokédex'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: PopupMenuButton(
              icon: const Icon(
                Icons.search,
              ),
              onSelected: (value) {},
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: null,
                    enabled: false,
                    onTap: null,
                    child: SizedBox(
                      width: 300,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Busca'),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _searchController,
                            maxLength: 30,
                            buildCounter: (context,
                                    {int? currentLength,
                                    bool? isFocused,
                                    maxLength}) =>
                                null,
                            decoration: const InputDecoration(
                              label: Text('Nome do pokémon'),
                            ),
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  Modular.to.pop();
                                },
                                child: const Text('Cancelar'),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  if (_searchController.text.length >= 3) {
                                    Modular.to.pop();
                                    Modular.to.pushNamed(
                                        '/search/${_searchController.text}');
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        content: Row(
                                          children: const [
                                            Icon(
                                              Icons.error_outline,
                                              color: Colors.grey,
                                            ),
                                            SizedBox(
                                              width: 8,
                                            ),
                                            Text('Digite pelo menos 3 letras.'),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                },
                                child: const Text('Buscar'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                        ],
                      ),
                    ),
                  ),
                ];
              },
            ),
          )
        ],
      ),
      body: AppWidgetGlobalList<ModelItem, HomeWidgetCardItem>(
        firstLoadingPage: const HomeWidgetPageLoading(),
        emptyItemsPage: const HomeWidgetPageEmpty(),
        moduleController: _homeStore.homeController,
        pageLimit: 20,
        requestCallback: (pageIndex) => HomeRepository.getItemList(pageIndex),
        parseCallback: (map) => ModelItem.fromMap(map),
        itemWidget: (model) => HomeWidgetCardItem(item: model),
      ),
    );
  }
}
