import 'package:flutter/material.dart';

class CalculatorInput extends StatelessWidget {
  final String expression;

  const CalculatorInput(this.expression, {super.key});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      // Se adapta conforme o input excede o tamanho da tela
      child: Text(
        expression,
        style: const TextStyle(
          fontWeight: FontWeight.normal,
          color: Color(0xffffffff),
          decoration: TextDecoration.none,
          fontSize: 50,
        ),
      ),
    );
  }
}
