import 'package:flutter/material.dart';

import '../atoms/input.dart';

class CalculatorScreen extends StatelessWidget {
  final String expression;

  const CalculatorScreen(this.expression, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 28.0, right: 8.0, left: 8.0),
                  child: CalculatorInput(expression),
                ),
              ]),
        ));
  }
}
