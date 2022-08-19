import 'package:flutter/material.dart';

class HomeWidgetPageLoading extends StatelessWidget {
  const HomeWidgetPageLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
