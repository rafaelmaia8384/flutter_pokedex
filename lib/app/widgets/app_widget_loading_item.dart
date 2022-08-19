import 'package:flutter/material.dart';

class AppWidgetLoadingItem extends StatelessWidget {
  const AppWidgetLoadingItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 128,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
