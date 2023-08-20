import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calculator/logic/providers/theme_provider.dart';
import 'package:calculator/pages/history_page.dart';
import 'package:calculator/widgets/buttons_section.dart';
import 'package:calculator/widgets/custom_app_bar.dart';
import 'package:calculator/widgets/custom_switch.dart';
import 'package:calculator/widgets/question_result_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ThemeProvider themeProvider, child) {
      return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: CustomAppBar(
              leading:
                  //todo: this is place holder
                  //todo: postponed
                  InkWell(onTap: () {}, child: const Icon(Icons.lock_clock)),
              actionWidget: InkWell(
                child: const Icon(Icons.history),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HistoryPage()));
                },
              ),
              titleWidget: CustomSwitch(
                  value: themeProvider.isDark,
                  onChanged: () => {
                        themeProvider.isDark
                            ? themeProvider.isDark = false
                            : themeProvider.isDark = true
                      })),
          body: const Column(
            children: <Widget>[
              Expanded(flex: 4, child: QuestionResultSection()),
              Expanded(flex: 5, child: ButtonsSection())
            ],
          ));
    });
  }
}
