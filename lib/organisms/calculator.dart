import 'package:flutter/material.dart';

import '../molecules/screen.dart';
import '../molecules/keyboard.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      home: Container(
        color: const Color(0xff17181A),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: const [
              CalculatorScreen('123.5'),
              CalculatorKeyboard(),
            ],
          ),
        ),
      ),
    );
  }
}
