import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton(
      {Key? key,
      required this.text,
      this.icon,
      required this.onTapCallback,
      required this.textStyle,
      required this.color})
      : super(key: key);

  final String text;
  final Icon? icon;
  final Function onTapCallback;
  final TextStyle textStyle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapCallback(),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(80),
            child: Container(
              height: 80,
              width: 80,
              color: color,
              child: Center(
                  child: icon ??
                      Text(
                        text,
                        style: textStyle,
                      )),
            )),
      ),
    );
  }
}
