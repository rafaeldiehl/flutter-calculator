import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum CalculatorKeyType {
  operation,
  delete,
  result,
  number,
}

class CalculatorKey extends StatelessWidget {
  final String value;
  final bool isExpanded;
  final CalculatorKeyType type;
  final Function keyClicked;

  const CalculatorKey(
    this.value,
    this.keyClicked, {
    super.key,
    this.isExpanded = false,
    this.type = CalculatorKeyType.number,
  });

  @override
  Widget build(BuildContext context) {
    final Color buttonColor = _buildButtonColor(type);
    final Widget valueWidget = _buildValueWidget(value, type);

    return Expanded(
      flex: isExpanded ? 2 : 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
            onPressed: () {
              keyClicked(value);
            },
            style: TextButton.styleFrom(
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20), // Define a borda arredondada
              ),
            ),
            child: valueWidget),
      ),
    );
  }
}

// Função para determinar a cor de fundo do botão com base no tipo
Color _buildButtonColor(CalculatorKeyType type) {
  switch (type) {
    case CalculatorKeyType.delete:
      return const Color(0xffcf2e50);
    case CalculatorKeyType.operation:
      return const Color(0xff005DB2);
    case CalculatorKeyType.result:
      return const Color(0xff1991FF);
    default:
      return const Color(0xff20202a);
  }
}

// Função para converter textos, como 'del' em ícone
Widget _buildValueWidget(String value, CalculatorKeyType type) {
  final Color textButtonColor;

  // Textos com cor de fundo são brancos, os default são azuis
  if (type != CalculatorKeyType.number) {
    textButtonColor = const Color(0xffffffff);
  } else {
    textButtonColor = const Color(0xff1ba9e8);
  }

  switch (value) {
    case 'del':
      return const Icon(
        Icons.backspace,
        size: 30,
        color: Color(0xffffffff),
      );
    case '/':
      return const Icon(
        CupertinoIcons.divide,
        size: 30,
        color: Color(0xffffffff),
      );
    case '*':
      return const Icon(
        Icons.clear,
        size: 30,
        color: Color(0xffffffff),
      );
    case '+':
      return const Icon(
        Icons.add,
        size: 30,
        color: Color(0xffffffff),
      );
    case '-':
      return const Icon(
        Icons.remove,
        size: 30,
        color: Color(0xffffffff),
      );
    case '=':
      return Text(
        value,
        style: const TextStyle(
          fontSize: 36,
          fontWeight: FontWeight.normal,
          color: Color(0xffffffff),
        ),
      );
    default:
      return Text(
        value,
        style: TextStyle(
          fontSize: 27,
          fontWeight: FontWeight.normal,
          color: textButtonColor,
        ),
      );
  }
}
