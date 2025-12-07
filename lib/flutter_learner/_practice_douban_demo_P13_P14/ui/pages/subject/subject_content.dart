import 'dart:math';

import 'package:flutter/material.dart';

class SubjectContent extends StatefulWidget {
  const SubjectContent({super.key});

  @override
  State<SubjectContent> createState() => _SubjectContentState();
}

class _SubjectContentState extends State<SubjectContent> {
  @override
  Widget build(BuildContext context) {
    return Center(child: ArcPointer());
  }
}

// 仪表盘指针
class ArrowPointer extends StatelessWidget {
  final double radius;

  final double height;

  const ArrowPointer({super.key, this.radius = 4}) : height = radius * 13;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // 三角形
        CustomPaint(
          size: Size(radius, height),
          painter: _ArrowPointerPainter(),
        ),
        Positioned(
          left: 0,
          bottom: -radius / 2,
          child: Container(
            width: radius,
            height: radius,
            decoration: BoxDecoration(
              color: Colors.redAccent,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}

class _ArrowPointerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.redAccent
      ..style = PaintingStyle.fill;

    // 画~
    final path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class ArcPointer extends StatelessWidget {
  const ArcPointer({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(187, 187),
      painter: _ArcPointerPainter(),
    );
  }
}

class _ArcPointerPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTRB(0, 0, size.width / 2, size.height / 2);

    // 着色器
    final shader = SweepGradient(
      colors: [
        Color(0xFF5968DE),
        Color(0xFF52AFC8),
        Color(0xFF52AFC8),
        Color(0xFF5968DE),
      ],
      startAngle: pi / 2,
      endAngle: 2 * pi,
    ).createShader(rect);

    final paint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..shader = shader;

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2,
      paint,
    );

    // SHADOW
    final center = Offset(size.width / 2, size.height / 2);
    final shadowPaint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..color = Color(0xFF05142B)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10);

    canvas.drawCircle(center, 80, shadowPaint);

    // shadow circle
    final shadowCirclePaint = Paint()
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..color = Color(0xFF0e303a);

    canvas.drawCircle(center, 80, shadowCirclePaint);

    // final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final paint3 = Paint()
      ..color = Colors.cyan
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    double totalCircumference = 2 * pi * radius;
    double startAngle = -pi / 2; // 从顶部开始
    double currentLength = 0;

    while (currentLength < totalCircumference) {
      final sweepAngle = (10 / radius); // 弧度
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: 73.26),
        startAngle,
        sweepAngle,
        false,
        paint3,
      );
      startAngle += (15) / radius; // 移动到下一段
      currentLength += 15;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class DashedCirclePainter extends CustomPainter {
  final double dashLength; // 每段长度
  final double gapLength; // 间隔长度
  final Color color; // 颜色
  final double strokeWidth;

  DashedCirclePainter({
    this.dashLength = 10,
    this.gapLength = 5,
    this.color = Colors.cyan,
    this.strokeWidth = 2,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double totalCircumference = 2 * pi * radius;
    double startAngle = -pi / 2; // 从顶部开始
    double currentLength = 0;

    while (currentLength < totalCircumference) {
      final sweepAngle = (dashLength / radius); // 弧度
      canvas.drawArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
        false,
        paint,
      );
      startAngle += (dashLength + gapLength) / radius; // 移动到下一段
      currentLength += dashLength + gapLength;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
