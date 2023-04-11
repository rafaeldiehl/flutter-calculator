import 'package:flutter/material.dart';

import '../atoms/key.dart';

class CalculatorKeyRow extends StatelessWidget {
  final List<CalculatorKey> keys;

  const CalculatorKeyRow(this.keys, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: keys,
      ),
    );
  }
}
