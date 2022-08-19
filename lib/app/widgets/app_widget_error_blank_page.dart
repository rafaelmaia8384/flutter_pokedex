import 'package:flutter/material.dart';

class AppWidgetBlankPage extends StatelessWidget {
  const AppWidgetBlankPage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.check_box_outline_blank,
            color: Colors.grey,
            size: 128,
          ),
          SizedBox(
            height: 16,
          ),
          Text('Nenhum resultado.'),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
