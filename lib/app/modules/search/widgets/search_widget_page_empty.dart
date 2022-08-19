import 'package:flutter/material.dart';

class SearchWidgetPageEmpty extends StatelessWidget {
  const SearchWidgetPageEmpty({
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
            'Nenhum pokémon encontrado.',
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
