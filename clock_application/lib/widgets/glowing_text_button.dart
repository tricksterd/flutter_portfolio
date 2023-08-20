import 'package:flutter/material.dart';

class GlowingTextButton extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final Color shadowColor;
  final List<Color> gradientColors;
  const GlowingTextButton({
    super.key,
    required this.child,
    required this.height,
    required this.width,
    required this.shadowColor,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(18)),
              boxShadow: [
                BoxShadow(
                    color: shadowColor,
                    spreadRadius: 3,
                    blurRadius: 5,
                    offset: const Offset(0, 5))
              ],
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: gradientColors)),
          child: Center(child: child),
        ),
      ),
    );
  }
}
