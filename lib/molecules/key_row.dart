import 'package:flutter/material.dart';

import '../atoms/key.dart';

class CalculatorKeyRow extends StatelessWidget {
  final List<CalculatorKey> keys;

  const CalculatorKeyRow(this.keys, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: keys,
      ),
    );
  }
}
