import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobx/mobx.dart';

import '../../app_store.dart';
import '../../models/model_item.dart';

part 'home_store.g.dart';

class HomeStore = HomeStoreBase with _$HomeStore;

abstract class HomeStoreBase with Store {
  ModuleController<ModelItem> homeController = ModuleController(
    pagingController: PagingController<int, ModelItem>(firstPageKey: 0),
    scrollOffset: 0,
  );
}
