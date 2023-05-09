import 'package:flutter/material.dart';

class Background extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color=Colors.blue.withOpacity(0.1);
    Path path = Path()
      ..moveTo(0, size.height*0.2)
      ..lineTo(size.width*0.5, size.height*0.2)
      ..lineTo(size.width*0.5, 0)
      ..lineTo(0, 0)
      ..close();
    canvas.drawPath(path, paint);

}

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}