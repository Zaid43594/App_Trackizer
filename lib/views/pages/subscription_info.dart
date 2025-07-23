import 'dart:ui' as ui;

import 'package:flutter/material.dart';

// void main() {
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.blue[300],
//         body: Center(child: TicketWidget(width: 300, height: 200)),
//       ),
//       debugShowCheckedModeBanner: false,
//     ),
//   );
// }

class TicketWidget extends StatelessWidget {
  final double width;
  final double height;

  const TicketWidget({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(width, height),
      painter: TicketShapeWithSideNotchAndCutoutDash(),
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // القسم العلوي
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Flight: TK198",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text("From: Paris → Tokyo"),
                SizedBox(height: 8),
                Text("Time: 08:00 AM"),
              ],
            ),

            // القسم السفلي - باركود
            Container(
              height: 40,
              color: Colors.black12,
              alignment: Alignment.center,
              child: const Text(
                "|||||||||||||",
                style: TextStyle(letterSpacing: 4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TicketShapeWithSideNotchAndCutoutDash extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;
    const radius = 12.0;
    const notchRadius = 13.0;

    final path = ui.Path();

    // رسم شكل التيكيت مع النوتشات
    path.moveTo(0, radius);
    path.quadraticBezierTo(0, 0, radius, 0);
    path.lineTo(size.width - radius, 0);
    path.quadraticBezierTo(size.width, 0, size.width, radius);

    final notchY = size.height * 0.7;
    path.lineTo(size.width, notchY - notchRadius);
    path.arcToPoint(
      Offset(size.width, notchY + notchRadius),
      radius: const Radius.circular(notchRadius),
      clockwise: false,
    );
    path.lineTo(size.width, size.height - radius);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - radius,
      size.height,
    );
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);
    path.lineTo(0, notchY + notchRadius);
    path.arcToPoint(
      Offset(0, notchY - notchRadius),
      radius: const Radius.circular(notchRadius),
      clockwise: false,
    );
    path.lineTo(0, radius);
    path.close();

    // نبدأ طبقة جديدة مع saveLayer للسماح بالـ clear blend mode
    final layerRect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.saveLayer(layerRect, Paint());

    // رسم التيكيت
    canvas.drawShadow(path, Colors.black26, 4.0, true);
    canvas.drawPath(path, paint);

    // إعداد الرسم للخط المنقط (شرطات) - رسم الخط الكامل بالأسود أولاً
    final dashPaint = Paint()
      ..color = Colors.black54
      ..strokeWidth = 2;

    final dashWidth = 8.0;
    final dashSpace = 10.0;
    double startX = notchRadius;
    final endX = size.width - notchRadius;
    final y = notchY;

    // خط كامل
    canvas.drawLine(Offset(startX, y), Offset(endX, y), dashPaint);

    // إعداد الطلاء لمسح الشرطات (فراغات شفافة)
    final clearPaint = Paint()
      ..blendMode = BlendMode.clear
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

// رسم الفراغات عبر مسح أجزاء من الخط السابق
    double dashStart = startX;
    while (dashStart < endX) {
      final dashEnd =
          (dashStart + dashWidth) < endX ? (dashStart + dashWidth) : endX;
      canvas.drawLine(Offset(dashStart, y), Offset(dashEnd, y), clearPaint);
      dashStart += dashWidth + dashSpace;
    }

    // ننهي الطبقة
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
