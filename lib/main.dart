import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: CustomPaint(
            size: Size(300, 600),
            painter: MapPainter(),
          ),
        ),
      ),
    );
  }
}

class MapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final backgroundPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill;

    final textPainter = TextPainter(
      text: TextSpan(
        text: 'فلسطين',
        style: TextStyle(
          color: Colors.black,
          fontSize: 40,
          fontWeight: FontWeight.bold,
        ),
      ),
      textDirection: TextDirection.rtl,
    );

    textPainter.layout();

    // Define the path for the map
    final path = Path();
    path.moveTo(size.width * 0.5, size.height * 0.1);
    path.lineTo(size.width * 0.3, size.height * 0.3);
    path.lineTo(size.width * 0.35, size.height * 0.5);
    path.lineTo(size.width * 0.25, size.height * 0.7);
    path.lineTo(size.width * 0.5, size.height * 0.9);
    path.lineTo(size.width * 0.75, size.height * 0.7);
    path.lineTo(size.width * 0.65, size.height * 0.5);
    path.lineTo(size.width * 0.7, size.height * 0.3);
    path.close();

    // Draw the background
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    // Draw the map shape
    canvas.drawPath(path, paint);

    // Draw the text
    final textOffset = Offset(
      (size.width - textPainter.width) / 2,
      (size.height - textPainter.height) / 2,
    );

    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
