import 'package:flutter/cupertino.dart';
import 'package:math_expressions/math_expressions.dart';

import 'package:calculator/collections/operation.dart';
import 'package:calculator/logic/providers/db_provider.dart';
import 'package:calculator/model/button_model.dart';

enum QuestionState { shown, hidden }

enum FocusOn { question, result }

class CalculatorProvider extends ChangeNotifier {
  String question = '0';

  QuestionState questionState = QuestionState.hidden;
  FocusOn focusOn = FocusOn.result;

  String result = '0';

  late DbProvider _dbProvider;

  CalculatorProvider(DbProvider dbProvider) {
    _dbProvider = dbProvider;
  }

  final List<ButtonModel> buttons = [
    ButtonModel(text: 'AC'),
    ButtonModel(text: '7'),
    ButtonModel(text: '4'),
    ButtonModel(text: '1'),
    ButtonModel(text: '0'),
    ButtonModel(text: 'DEL', iconData: CupertinoIcons.delete_left),
    ButtonModel(text: '8'),
    ButtonModel(text: '5'),
    ButtonModel(text: '2'),
    ButtonModel(text: '00'),
    ButtonModel(text: '/', iconData: CupertinoIcons.divide),
    ButtonModel(text: '9'),
    ButtonModel(text: '6'),
    ButtonModel(text: '3'),
    ButtonModel(
      text: '.',
    ),
    ButtonModel(text: '%', iconData: CupertinoIcons.percent),
    ButtonModel(text: '*', iconData: CupertinoIcons.multiply),
    ButtonModel(text: '-', iconData: CupertinoIcons.minus),
    ButtonModel(text: '+', iconData: CupertinoIcons.plus),
    ButtonModel(text: '=', iconData: CupertinoIcons.equal)
  ];

  List<String> commandButtons = [
    'AC',
    'DEL',
    '/',
    '%',
    'x',
    '-',
    '+',
  ];

  List<String> operators = ['/', '%', '*', '-', '+', '.'];
  List<String> nulls = ['0', '00'];

  bool isOperatorsContainSymbol(String value) {
    return isListContainSymbol(operators, value);
  }

  bool isSymbolsNulls(String value) {
    return isListContainSymbol(nulls, value);
  }

  bool isListContainSymbol(List<String> list, String value) {
    return list.contains(value);
  }

  bool isQuestionEmpty() {
    return question.length == 1 && question == '0';
  }

  void addEquationToQuestion(String equation) {
    if (isQuestionEmpty()) {
      question = equation;
    } else {
      question += equation;
    }
    showQuestion();
    focusOnQuestion();
    evaluateExpression();
    notifyListeners();
  }

  void addSymbolToQuestion(String symbol) {
    //todo: change using icons in question on home_page
    if (isQuestionEmpty() && isSymbolsNulls(symbol)) {
      return;
    }
    if (focusOn == FocusOn.result &&
        !isQuestionEmpty() &&
        isOperatorsContainSymbol(symbol)) {
      focusOn = FocusOn.question;
      Operation operation = Operation()
        ..question = question
        ..result = result;
      _dbProvider.saveOperation(operation);
      question = result;
    }
    if (isQuestionEmpty() && !isOperatorsContainSymbol(symbol)) {
      question = symbol;
    } else {
      removeLastOperatorIfNewSymbolIsOperatorToo(symbol);
      question += symbol;
    }

    showQuestion();
    focusOnQuestion();
    evaluateExpression();
  }

  void removeLastOperatorIfNewSymbolIsOperatorToo(String symbol) {
    if (question.length > 1 &&
        isOperatorsContainSymbol(question[question.length - 1]) &&
        isOperatorsContainSymbol(symbol)) {
      question = question.substring(0, question.length - 1);
    }
  }

  void showQuestion() {
    if (!isQuestionEmpty()) {
      questionState = QuestionState.shown;
    }
  }

  void evaluateExpression() {
    Parser parser = Parser();
    Expression exp;

    if (isOperatorsContainSymbol(question[question.length - 1])) {
      exp = parser.parse(question.substring(0, question.length - 1));
    } else {
      exp = parser.parse(question);
    }

    result =
        removeTrailingZero(exp.evaluate(EvaluationType.REAL, ContextModel()));
  }

  String removeTrailingZero(double resultValue) {
    String stringResultValue = resultValue.toString();
    if (stringResultValue.substring(stringResultValue.length - 2) == '.0') {
      return resultValue.toStringAsFixed(0);
    }
    return stringResultValue;
  }

  void returnCallBack(int index) {
    if (buttons[index].text == 'AC') {
      clearAll();
    } else if (buttons[index].text == 'DEL') {
      removeSymbolFromQuestion();
    } else {
      addSymbolToQuestion(buttons[index].text);
    }
    notifyListeners();
  }

  void clearAll() {
    question = '0';
    result = '0';
    questionState = QuestionState.hidden;
    focusOn = FocusOn.result;
  }

  void removeSymbolFromQuestion() {
    if (question.isNotEmpty && question.length > 1) {
      removeLastSymbol();
      evaluateExpression();
    } else if (question.length == 1 && question != '0') {
      clearAll();
    }
  }

  String removeLastSymbol() =>
      question = question.substring(0, question.length - 1);

  void focusOnQuestion() {
    focusOn = FocusOn.question;
    notifyListeners();
  }

  void focusOnResult() {
    focusOn = FocusOn.result;
    notifyListeners();
  }
}
