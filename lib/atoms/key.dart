import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum CalculatorKeyType {
  OPERATION,
  DELETE,
  RESULT,
  NUMBER,
}

class CalculatorKey extends StatelessWidget {
  final String value;
  final bool isExpanded;
  final CalculatorKeyType type;

  const CalculatorKey(
    this.value, {
    super.key,
    this.isExpanded = false,
    this.type = CalculatorKeyType.NUMBER,
  });

  @override
  Widget build(BuildContext context) {
    final Color buttonColor = _buildButtonColor(this.type);
    final Widget valueWidget = _buildValueWidget(this.value, this.type);

    return Expanded(
      flex: isExpanded ? 2 : 1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(20), // define a borda arredondada
              ),
            ),
            child: valueWidget),
      ),
    );
  }
}

Color _buildButtonColor(CalculatorKeyType type) {
  switch (type) {
    case CalculatorKeyType.DELETE:
      return const Color(0xffcf2e50);
    case CalculatorKeyType.OPERATION:
      return const Color(0xff005DB2);
    case CalculatorKeyType.RESULT:
      return const Color(0xff1991FF);
    default:
      return const Color(0xff20202a);
  }
}

Widget _buildValueWidget(String value, CalculatorKeyType type) {
  final Color textButtonColor;

  if (type != CalculatorKeyType.NUMBER) {
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
