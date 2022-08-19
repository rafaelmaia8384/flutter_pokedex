import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../app_config.dart';
import '../../app_store.dart';
import '../../models/model_item.dart';
import '../../widgets/app_widget_global_list.dart';
import 'search_repository.dart';
import 'search_store.dart';
import 'widgets/search_widget_card_item.dart';
import 'widgets/search_widget_page_empty.dart';
import 'widgets/search_widget_page_loading.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({
    Key? key,
    required this.pokeName,
  }) : super(key: key);
  final String pokeName;
  @override
  Widget build(BuildContext context) {
    final _searchStore = Modular.get<SearchStore>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Pokédex'),
      ),
      body: AppWidgetGlobalList<ModelItem, SearchWidgetCardItem>(
        firstLoadingPage: const SearchWidgetPageLoading(),
        emptyItemsPage: const SearchWidgetPageEmpty(),
        moduleController: _searchStore.searchController,
        pageLimit: 1154,
        requestCallback: (pageIndex) => SearchRepository.getItemList(pageIndex),
        parseCallback: (map) => ModelItem.fromMap(map),
        searchCallback: (list) => list
            .where((e) => e.name!.contains(pokeName.toLowerCase()))
            .toList(),
        itemWidget: (model) => SearchWidgetCardItem(item: model),
      ),
    );
  }
}
