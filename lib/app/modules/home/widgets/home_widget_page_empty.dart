import 'package:flutter/material.dart';

class HomeWidgetPageEmpty extends StatelessWidget {
  const HomeWidgetPageEmpty({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_box_outline_blank,
            color: Colors.grey.shade300,
            size: 128,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'Nenhum pokémon.',
            style: TextStyle(color: Colors.grey.shade400),
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
