import 'package:flutter/material.dart';

class CustomNavBarPainter extends CustomPainter {
  CustomNavBarPainter({required this.backgroundColor});

  final Color backgroundColor;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = backgroundColor;

    var path = Path()
      ..moveTo(0, 20)
      ..quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0)
      ..quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20)
      ..arcToPoint(Offset(size.width * 0.60, 20),
          radius: const Radius.circular(20.0), clockwise: false)
      ..quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0)
      ..quadraticBezierTo(size.width * 0.80, 0, size.width, 20)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(0, 20);
    canvas
      ..drawShadow(path, Colors.black, 5, true)
      ..drawPath(path, paint);
  }

  // coverage:ignore-start
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
  // coverage:ignore-end
}
