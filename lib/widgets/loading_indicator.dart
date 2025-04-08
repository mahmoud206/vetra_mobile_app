import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          strokeWidth: 6,
        ),
        const SizedBox(height: 20),
        Text(
          'جاري تحميل البيانات...',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: Colors.green[800],
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'يرجى الانتظار',
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}