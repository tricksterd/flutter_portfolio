import 'package:calculator/logic/providers/calculator_provider.dart';
import 'package:calculator/logic/providers/db_provider.dart';
import 'package:calculator/logic/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:calculator/app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: ((context) => DbProvider())),
    ChangeNotifierProvider(create: ((context) => ThemeProvider())),
    ChangeNotifierProvider(
        create: ((context) => CalculatorProvider(context.read<DbProvider>())))
  ], child: const App()));
}
