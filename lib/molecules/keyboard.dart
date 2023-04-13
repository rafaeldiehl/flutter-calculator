import 'package:flutter/material.dart';

import '../atoms/key.dart';
import 'key_row.dart';

class CalculatorKeyboard extends StatelessWidget {
  final Function keyClicked;

  const CalculatorKeyboard(this.keyClicked, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 36.0),
      child: SizedBox(
        height: 400,
        child: Column(
          children: [
            CalculatorKeyRow([
              CalculatorKey(
                'AC',
                keyClicked,
                isExpanded: true,
                type: CalculatorKeyType.delete,
              ),
              CalculatorKey(
                'del',
                keyClicked,
                type: CalculatorKeyType.delete,
              ),
              CalculatorKey(
                '/',
                keyClicked,
                type: CalculatorKeyType.operation,
              ),
            ]),
            CalculatorKeyRow([
              CalculatorKey('7', keyClicked),
              CalculatorKey('8', keyClicked),
              CalculatorKey('9', keyClicked),
              CalculatorKey(
                '*',
                keyClicked,
                type: CalculatorKeyType.operation,
              ),
            ]),
            CalculatorKeyRow([
              CalculatorKey('4', keyClicked),
              CalculatorKey('5', keyClicked),
              CalculatorKey('6', keyClicked),
              CalculatorKey(
                '-',
                keyClicked,
                type: CalculatorKeyType.operation,
              ),
            ]),
            CalculatorKeyRow([
              CalculatorKey('1', keyClicked),
              CalculatorKey('2', keyClicked),
              CalculatorKey('3', keyClicked),
              CalculatorKey(
                '+',
                keyClicked,
                type: CalculatorKeyType.operation,
              ),
            ]),
            CalculatorKeyRow([
              CalculatorKey('0', keyClicked),
              CalculatorKey('.', keyClicked),
              CalculatorKey(
                '=',
                keyClicked,
                isExpanded: true,
                type: CalculatorKeyType.result,
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
