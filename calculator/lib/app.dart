import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator/pages/home_page.dart';
import 'package:calculator/theme.dart';
import 'logic/providers/theme_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeProvider themeProvider, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: themeProvider.isDark ? AppTheme.darkTheme : AppTheme.lightTheme,
        home: const HomePage(),
      );
    });
  }
}
