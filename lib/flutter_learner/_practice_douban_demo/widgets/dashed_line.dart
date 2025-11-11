import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  // 虚线方向, 默认为垂直方向
  final Axis direction;

  // 虚线颜色
  final Color color;

  // 虚线线段长度
  final double dashLength;

  // 虚线线段宽度
  final double dashThickness;

  // 虚线线段个数
  final int dashCount;

  // 虚线长度
  final double length;

  DashedLine({
    super.key,
    this.direction = Axis.horizontal,
    Color? color,
    this.dashLength = 1,
    this.dashThickness = 1,
    this.dashCount = 10,
    required this.length,
  }) : color = color ?? Color(0xFFBBBBBB);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: direction == Axis.horizontal ? length : null,
      height: direction == Axis.vertical ? length : null,
      child: Flex(
        direction: direction,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          dashCount,
          (_) => SizedBox(
            width: dashLength,
            height: dashThickness,
            child: DecoratedBox(decoration: BoxDecoration(color: color)),
          ),
        ),
      ),
    );
  }
}
