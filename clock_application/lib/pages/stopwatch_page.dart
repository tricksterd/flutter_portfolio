import 'package:clock_application/logic/providers/stopwatch_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StopwatchPage extends StatelessWidget {
  const StopwatchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final stopwatchProvider = context.watch<StopwatchProvider>();

    return Scaffold(
      body: Center(child: Text(stopwatchProvider.stopwatch)),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        FloatingActionButton(
            onPressed: () => stopwatchProvider.stopStopwatch(),
            child: const Icon(CupertinoIcons.stop)),
        FloatingActionButton(
          onPressed: () => stopwatchProvider.runStopwatch(),
          child: const Icon(CupertinoIcons.play),
        ),
      ]),
    );
  }
}
