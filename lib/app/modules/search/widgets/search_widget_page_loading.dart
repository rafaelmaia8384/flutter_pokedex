import 'package:flutter/material.dart';

class SearchWidgetPageLoading extends StatelessWidget {
  const SearchWidgetPageLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
