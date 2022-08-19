import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobx/mobx.dart';

import '../../app_store.dart';
import '../../models/model_item.dart';

part 'search_store.g.dart';

class SearchStore = SearchStoreBase with _$SearchStore;

abstract class SearchStoreBase with Store {
  ModuleController<ModelItem> searchController = ModuleController(
    pagingController: PagingController<int, ModelItem>(firstPageKey: 0),
    scrollOffset: 0,
  );
}
