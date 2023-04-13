import 'package:flutter/material.dart';

import '../molecules/screen.dart';
import '../molecules/keyboard.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String expression = '0';
  double firstOperand = 0;
  double secondOperand = 0;
  String? operator;

  // Controle para verificar se está esperando um segundo operando
  bool secondOperandComing = false;
  // Controle no caso da divisão por 0
  bool errorMessage = false;

  keyClicked(String keyValue) {
    setState(() {
      switch (keyValue) {
        case 'AC':
          addClearKey();
          break;
        case 'del':
          addBackspaceKey();
          break;
        case '+':
        case '-':
        case '/':
        case '*':
          addOperationKey(keyValue);
          break;
        case '=':
          addEqualKey();
          break;
        default:
          addNumberKey(keyValue);
          break;
      }
    });
  }

  void addClearKey() {
    expression = '0';
    firstOperand = 0;
    secondOperand = 0;
    secondOperandComing = false;
  }

  void addBackspaceKey() {
    if (expression.length == 1) {
      expression = '0';
    } else {
      expression = expression.substring(0, expression.length - 1);
    }
  }

  void addOperationKey(String keyValue) {
    // Se houver um operação anterior, ele a calcula antes de ir pra próxima
    if (operator != null) {
      addEqualKey();
    }
    firstOperand = double.parse(expression);
    operator = keyValue;
    secondOperandComing = true;
  }

  void addEqualKey() {
    // Não faz nada quando não há uma operação
    if (operator == null) {
      return;
    }

    secondOperand = double.parse(expression);
    double result = 0;

    switch (operator) {
      case '+':
        result = firstOperand + secondOperand;
        break;
      case '-':
        result = firstOperand - secondOperand;
        break;
      case '*':
        result = firstOperand * secondOperand;
        break;
      case '/':
        // Divisão por zero
        if (secondOperand == 0) {
          expression = 'Erro: Divisão por 0';
          operator = null;
          secondOperandComing = true;
          errorMessage = true;
          return;
        }
        result = firstOperand / secondOperand;
        break;
    }

    // Remove as casas decimais em inteiros
    expression = formatCalculatorResult(result);
    operator = null;
    secondOperandComing = true;
  }

  void addNumberKey(String keyValue) {
    if (secondOperandComing) {
      // Não é permitido começar com '.' quando digitar o segundo operando
      if (keyValue != '.') {
        expression = keyValue;
        secondOperandComing = false;
      }
    } else {
      // Se a expressão iniciar com '0' ou mensagem de erro, o próximo
      // valor informado vai iniciar a expressão novamente. Além disso,
      // não é permitido começar com '.'
      if ((expression == '0' || errorMessage) && keyValue != '.') {
        // Após exibir a mensagem de erro, os dados são limpos
        if (errorMessage) {
          addClearKey();
          errorMessage = false;
        }
        expression = keyValue;
      } else {
        // Não permite mais de um '.' na expressão
        if (expression.contains('.') && keyValue == '.') {
          return;
        }
        expression += keyValue;
      }
    }
  }

  // Remove ".0" do fim dos inteiros
  String formatCalculatorResult(double result) {
    String resultString = result.toString();
    if (resultString.endsWith(".0")) {
      resultString = resultString.substring(0, resultString.length - 2);
    }
    return resultString;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      home: Container(
        color: const Color(0xff17181A),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              CalculatorScreen(expression),
              CalculatorKeyboard(keyClicked),
            ],
          ),
        ),
      ),
    );
  }
}
