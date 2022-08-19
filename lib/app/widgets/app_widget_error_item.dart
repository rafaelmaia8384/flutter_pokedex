import 'package:flutter/material.dart';

class AppWidgetErrorItem extends StatelessWidget {
  const AppWidgetErrorItem(
      {Key? key, required this.error, required this.onTryAgain})
      : super(key: key);
  final String error;
  final VoidCallback onTryAgain;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 128,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline_sharp,
                color: Colors.grey,
                size: 32,
              ),
              const SizedBox(
                width: 8,
              ),
              OutlinedButton(
                onPressed: onTryAgain,
                child: const Text('Tentar novamente'),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            error,
            style: const TextStyle(
              fontSize: 10,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
