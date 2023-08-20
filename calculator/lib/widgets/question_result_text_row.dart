import 'package:flutter/material.dart';

class QuestionResultTextRow extends StatelessWidget {
  const QuestionResultTextRow(
      {super.key,
      required this.onTap,
      required this.textStyle,
      required this.child});

  final Function() onTap;
  final TextStyle textStyle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onTap();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: textStyle,
              child: child,
            ),
          ],
        ),
      ),
    );
  }
}
