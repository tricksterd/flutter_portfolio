import 'package:clock_application/widgets/glowing_text_button.dart';
import 'package:flutter/material.dart';

class AlarmPage extends StatelessWidget {
  const AlarmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SingleChildScrollView(
          child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: ((BuildContext context, int index) {
                return Column(
                  children: [
                    if (index != 0) const Divider(),
                    Row(
                      children: [
                        const Column(
                          children: [Text('Big text'), Text('Small text')],
                        ),
                        Switch(onChanged: (bool value) {}, value: true),
                      ],
                    )
                  ],
                );
              })),
        ),
        GlowingTextButton(
            height: 40,
            width: MediaQuery.of(context).size.width / 3,
            shadowColor: Colors.deepPurple[500]!,
            gradientColors: [Colors.lightBlue, Colors.deepPurple[500]!],
            child: const Text('Set clock',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)))
      ]),
    );
  }
}
