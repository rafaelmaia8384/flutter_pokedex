import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../app_config.dart';
import '../app_store.dart';
import '../models/model_response.dart';
import 'app_widget_error_item.dart';
import 'app_widget_error_page.dart';
import 'app_widget_loading_item.dart';

class AppWidgetGlobalList<T, U> extends StatefulWidget {
  const AppWidgetGlobalList({
    Key? key,
    required this.moduleController,
    required this.pageLimit,
    required this.requestCallback,
    required this.parseCallback,
    this.searchCallback,
    required this.firstLoadingPage,
    required this.emptyItemsPage,
    required this.itemWidget,
  }) : super(key: key);
  final ModuleController<T> moduleController;
  final int pageLimit;
  final Future<ServerResponse> Function(int) requestCallback;
  final T Function(Map<String, dynamic> map) parseCallback;
  final List<T> Function(List<T>)? searchCallback;
  final Widget firstLoadingPage;
  final Widget emptyItemsPage;
  final U Function(T) itemWidget;
  @override
  State<AppWidgetGlobalList> createState() => _AppWidgetGlobalListState<T, U>();
}

class _AppWidgetGlobalListState<T, U> extends State<AppWidgetGlobalList<T, U>> {
  String? _errorDetails;

  Future _fetchPage(int pageKey, int pageLimit) async {
    ServerResponse serverResponse = await widget.requestCallback(pageKey);
    if (serverResponse.statusCode! < 400) {
      Iterable i = (await json.decode(serverResponse.data))['results'];
      List<T> list = List<T>.from(
        i.map((o) => widget.parseCallback(o)),
      );

      if (widget.searchCallback != null) {
        list = widget.searchCallback!(list);
      }

      final isLastPage = list.length < widget.pageLimit;
      if (isLastPage) {
        widget.moduleController.pagingController.appendLastPage(list);
      } else {
        final nextPageKey = pageKey + 1;
        widget.moduleController.pagingController.appendPage(list, nextPageKey);
      }
    } else {
      widget.moduleController.pagingController.error = serverResponse.message;
      _errorDetails = serverResponse.details;
    }
  }

  @override
  void initState() {
    widget.moduleController.pagingController.addPageRequestListener(
      (pageKey) {
        _fetchPage(pageKey, widget.pageLimit);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController(
      initialScrollOffset: widget.moduleController.scrollOffset,
    );
    scrollController.addListener(() {
      widget.moduleController.scrollOffset = scrollController.offset;
    });
    return PagedListView<int, T>(
      scrollController: scrollController,
      pagingController: widget.moduleController.pagingController,
      builderDelegate: PagedChildBuilderDelegate<T>(
        firstPageProgressIndicatorBuilder: (context) => widget.firstLoadingPage,
        firstPageErrorIndicatorBuilder: (context) => AppWidgetErrorPage(
          error: widget.moduleController.pagingController.error,
          details: _errorDetails!,
          onTryAgain: () => widget.moduleController.pagingController.refresh(),
        ),
        newPageErrorIndicatorBuilder: (context) => AppWidgetErrorItem(
          error: widget.moduleController.pagingController.error,
          onTryAgain: () =>
              widget.moduleController.pagingController.retryLastFailedRequest(),
        ),
        newPageProgressIndicatorBuilder: (context) =>
            const AppWidgetLoadingItem(),
        noItemsFoundIndicatorBuilder: (context) => widget.emptyItemsPage,
        noMoreItemsIndicatorBuilder: (context) => const SizedBox(height: 64),
        itemBuilder: (context, item, index) =>
            widget.itemWidget(item) as Widget,
      ),
    );
  }
}
