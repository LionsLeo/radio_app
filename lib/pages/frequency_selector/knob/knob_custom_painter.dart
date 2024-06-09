import 'dart:math';

import 'package:flutter/material.dart';
import 'package:radio_app/theme/app_theme.dart';

class KnobPainter extends CustomPainter {
  final knobPainter = Paint()..color = AppTheme.darkTheme.primaryColor;
  final ringPainter = Paint()
    ..style = PaintingStyle.stroke
    ..color = AppTheme.darkTheme.primaryColor
    ..strokeWidth = 2.5
    ..isAntiAlias = true;

  final scale = 1.5;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height);
    _drawKnob(canvas, size, center);
    _drawRing(canvas, size, center);
    _drawInnerDash(canvas, size, center);
    _drawOuterDash(canvas, size, center);
    _drawRectangle(canvas, size, center);
    _drawText(canvas, size, center);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  _drawKnob(Canvas canvas, Size size, Offset center) {
    canvas.drawCircle(center, (size.width / 2) * scale, knobPainter);
  }

  _drawRing(Canvas canvas, Size size, Offset center) {
    final radius = (size.width / 2) * (scale + 0.2);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      2 * pi * 100,
      false,
      ringPainter,
    );
  }

  _drawInnerDash(Canvas canvas, Size size, Offset center) {
    final dashPainter = Paint()
      ..color = AppTheme.darkTheme.primaryColor
      ..strokeWidth = 2.8;

    final outerRadius = (size.width / 2) * (scale + 0.17);
    final innerRadius = (size.width / 2) * (scale + 0.02);
    for (double i = 0; i < 360; i += 1.2) {
      final pt1 = _getCoordinates(center.dx, center.dy, outerRadius, i);
      final pt2 = _getCoordinates(center.dx, center.dy, innerRadius, i);
      canvas.drawLine(pt1, pt2, dashPainter);
    }
  }

  _drawOuterDash(Canvas canvas, Size size, Offset center) {
    final dashPainter = Paint()
      ..color = AppTheme.darkTheme.primaryColor
      ..strokeWidth = 2.8;

    final outerRadius = (size.width / 2) * (scale + 0.4);
    final innerRadius = (size.width / 2) * (scale + 0.275);
    for (double i = 0; i < 360; i += 3) {
      final pt1 = _getCoordinates(center.dx, center.dy, outerRadius, i);
      final pt2 = _getCoordinates(center.dx, center.dy, innerRadius, i);
      canvas.drawLine(pt1, pt2, dashPainter);
    }
  }

  _drawRectangle(Canvas canvas, Size size, Offset center) {
    final strokePainter = Paint()
      ..color = AppTheme.darkTheme.primaryColor
      ..strokeWidth = 2.8
      ..style = PaintingStyle.stroke;

    final redLinePainter = Paint()
      ..color = AppTheme.darkTheme.dividerColor
      ..strokeWidth = 2.8;

    final yellowTrianglePainter = Paint()
      ..color = const Color(0xffF9FABE)
      ..strokeWidth = 2.8;

    final fillPainter = Paint()
      ..color = AppTheme.darkTheme.scaffoldBackgroundColor;

    final shadowPainter = Paint()
      ..color = Colors.black.withOpacity(0.8)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

    final diameter = ((size.width / 2) * (scale + 0.4)) -
        ((size.width / 2) * (scale + 0.275));

    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromCenter(
                center: Offset(
                    center.dx,
                    (center.dy -
                        ((size.width / 2) * (scale + 0.4)) +
                        (diameter / 2) +
                        5)),
                width: (diameter),
                height: (diameter * 1.5)),
            const Radius.circular(5)),
        shadowPainter);

    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromCenter(
                center: Offset(
                    center.dx,
                    center.dy -
                        ((size.width / 2) * (scale + 0.4)) +
                        (diameter / 2)),
                width: (diameter),
                height: (diameter * 1.5)),
            const Radius.circular(5)),
        fillPainter);

    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromCenter(
                center: Offset(
                    center.dx,
                    center.dy -
                        ((size.width / 2) * (scale + 0.4)) +
                        (diameter / 2)),
                width: (diameter),
                height: (diameter * 1.5)),
            const Radius.circular(5)),
        strokePainter);

    canvas.drawLine(
        Offset(center.dx, center.dy - (size.width / 2) * (scale + 0.4)),
        Offset(center.dx, center.dy - (size.width / 2) * (scale + 0.275)),
        redLinePainter);

    canvas.drawLine(
        Offset(center.dx, (center.dy - (size.width / 2) * (scale + 0.4)) - 50),
        Offset(
            center.dx, (center.dy - (size.width / 2) * (scale + 0.275)) - 42.5),
        redLinePainter);

    final path = Path();
    const temp = 5;
    path.moveTo(
        center.dx, (center.dy - (size.width / 2) * (scale + 0.275)) - 80);
    path.lineTo(center.dx - temp,
        (center.dy - (size.width / 2) * (scale + 0.275)) - 90);
    path.lineTo(center.dx + temp,
        (center.dy - (size.width / 2) * (scale + 0.275)) - 90);
    path.close();
    canvas.drawPath(path, yellowTrianglePainter);
  }

  _drawText(Canvas canvas, Size size, Offset center) {}

  Offset _getCoordinates(double h, double k, double r, double theta) {
    // Convert theta from degrees to radians
    double thetaRadians = theta * (pi / 180);

    // Calculate the x and y coordinates
    double x = h + r * cos(thetaRadians);
    double y = k + r * sin(thetaRadians);

    // Return the coordinates as an Offset object
    return Offset(x, y);
  }
}
