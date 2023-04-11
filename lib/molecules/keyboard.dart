import 'package:flutter/material.dart';

import '../atoms/key.dart';
import 'key_row.dart';

class CalculatorKeyboard extends StatelessWidget {
  const CalculatorKeyboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 36.0),
      child: Container(
        height: 400,
        child: Column(
          children: [
            CalculatorKeyRow([
              CalculatorKey(
                'CE',
                isExpanded: true,
                type: CalculatorKeyType.DELETE,
              ),
              CalculatorKey(
                'del',
                type: CalculatorKeyType.DELETE,
              ),
              CalculatorKey(
                '/',
                type: CalculatorKeyType.OPERATION,
              ),
            ]),
            CalculatorKeyRow([
              CalculatorKey('7'),
              CalculatorKey('8'),
              CalculatorKey('9'),
              CalculatorKey(
                '*',
                type: CalculatorKeyType.OPERATION,
              ),
            ]),
            CalculatorKeyRow([
              CalculatorKey('4'),
              CalculatorKey('5'),
              CalculatorKey('6'),
              CalculatorKey(
                '-',
                type: CalculatorKeyType.OPERATION,
              ),
            ]),
            CalculatorKeyRow([
              CalculatorKey('1'),
              CalculatorKey('2'),
              CalculatorKey('3'),
              CalculatorKey(
                '+',
                type: CalculatorKeyType.OPERATION,
              ),
            ]),
            CalculatorKeyRow([
              CalculatorKey('0'),
              CalculatorKey('.'),
              CalculatorKey(
                '=',
                isExpanded: true,
                type: CalculatorKeyType.RESULT,
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
