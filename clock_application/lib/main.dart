import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clock_application/logic/providers/stopwatch_provider.dart';
import 'package:clock_application/pages/alarm_page.dart';
import 'package:clock_application/pages/clock_page.dart';
import 'package:clock_application/pages/stopwatch_page.dart';
import 'package:clock_application/pages/timer_page.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => StopwatchProvider())
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
            body: Container(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: const Column(
            children: [
              TabBar(
                indicatorPadding: EdgeInsets.only(bottom: 10),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: Colors.red,
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    text: 'Clock',
                  ),
                  Tab(
                    text: 'Alarm',
                  ),
                  Tab(
                    text: 'Stopwatch',
                  ),
                  Tab(text: 'Timer'),
                ],
              ),
              Expanded(
                child: TabBarView(children: [
                  ClockPage(),
                  AlarmPage(),
                  StopwatchPage(),
                  TimerPage(),
                ]),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
