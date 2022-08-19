import 'package:flutter/material.dart';

class AppWidgetErrorPage extends StatelessWidget {
  const AppWidgetErrorPage({
    Key? key,
    required this.error,
    required this.details,
    required this.onTryAgain,
  }) : super(key: key);
  final String error;
  final String details;
  final VoidCallback onTryAgain;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline_sharp,
            color: Colors.grey,
            size: 128,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(error),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              details,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          OutlinedButton(
            onPressed: onTryAgain,
            child: const Text('Tentar novamente'),
          ),
        ],
      ),
    );
  }
}
