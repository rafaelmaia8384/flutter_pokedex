import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {}

class ModuleController<T> {
  PagingController<int, T> pagingController;
  double scrollOffset;
  ModuleController({
    required this.pagingController,
    required this.scrollOffset,
  });
}
