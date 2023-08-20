import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  final double size;
  final Widget child;
  const ClockView({super.key, required this.size, required this.child});

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    // Timer.periodic(const Duration(minutes: 1), (timer) {
    //   setState(() {});
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Transform.rotate(
          angle: -pi / 2,
          child: CustomPaint(
            painter: ClockPainter(),
            child: Transform.rotate(
                angle: pi / 2, child: Center(child: widget.child)),
          )),
    );
  }
}

class ClockPainter extends CustomPainter {
  final dateTime = DateTime.now();
  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    final center = Offset(centerX, centerY);
    final radius = min(centerX, centerY);

    final outlineBrush = Paint()
      ..shader = const RadialGradient(colors: [Colors.redAccent, Colors.purple])
          .createShader(Rect.fromCircle(
              center: Offset(centerX + radius, centerY), radius: radius * 4))
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width / 27;

    final dashBrush = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    final hoursDashBrush = Paint()
      ..color = Colors.pink[500]!
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    final dotBrush = Paint()..color = Colors.pink[500]!;

    canvas.drawCircle(center, radius, outlineBrush);

    final dotX = centerX +
        size.width /
            2.25 *
            cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    final dotY = centerX +
        size.width /
            2.25 *
            sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);

    canvas.drawCircle(Offset(dotX, dotY), size.width / 43, dotBrush);

    var outerCircleRadius = radius * 1.165;
    var innerCircleRadius = radius * 1.1;
    for (double i = 0; i < 360; i += 3) {
      final innerCircleDot =
          calculateDotPosition(centerX, innerCircleRadius, i);
      if (i % 30 == 0) {
        final outerCircleDot =
            calculateDotPosition(centerX, outerCircleRadius * 1.06, i);
        canvas.drawLine(outerCircleDot, innerCircleDot, hoursDashBrush);
      } else {
        final outerCircleDot =
            calculateDotPosition(centerX, outerCircleRadius, i);

        canvas.drawLine(outerCircleDot, innerCircleDot, dashBrush);
      }
    }
  }

  Path getCirclePath(Offset center, double radius) {
    return Path()..addOval(Rect.fromCircle(center: center, radius: radius));
  }

  Offset calculateDotPosition(double centerX, double radius, double angle) {
    final newX = centerX + radius * cos(angle * pi / 180);
    final newY = centerX + radius * sin(angle * pi / 180);

    return Offset(newX, newY);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
