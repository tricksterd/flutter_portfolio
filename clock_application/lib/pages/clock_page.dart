import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:clock_application/widgets/clock_view.dart';
import 'package:clock_application/widgets/glowing_text_button.dart';

class ClockPage extends StatelessWidget {
  const ClockPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const double clockSize = 230;
    final time = DateTime.now();
    final formattedTime = DateFormat('HH:mm').format(time);
    final formattedDate = DateFormat('EEEE d, MMMM').format(time);
    return Container(
      padding: const EdgeInsets.only(top: 32, left: 32, right: 32),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClockView(
            size: clockSize,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(formattedTime,
                    style: const TextStyle(
                        fontSize: clockSize / 5, fontWeight: FontWeight.bold)),
                Text(formattedDate,
                    style: const TextStyle(fontSize: clockSize / 17.85)),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 185,
            child: SingleChildScrollView(
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    TextStyle textStyle = const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold);
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('City Name', style: textStyle),
                            Text('Current Time',
                                style: textStyle.copyWith(
                                    fontWeight: FontWeight.w400))
                          ]),
                    );
                  }),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          GlowingTextButton(
            width: MediaQuery.of(context).size.width / 3,
            height: 40,
            shadowColor: Colors.pink[600]!,
            gradientColors: [Colors.pink[300]!, Colors.pink[600]!],
            child: const Text('Set clock',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18)),
          )
        ],
      ),
    );
  }
}
