import 'package:flutter/material.dart';

class StarRating extends StatefulWidget {
  // 评分
  final double rating;

  // 总分
  final double maxRating;

  // 星星数量
  final int starCount;

  // 星星的大小
  final double starSize;

  // 选中的颜色
  final Color activeColor;

  // 未选中的颜色
  final Color inactiveColor;

  // 选中时的图标
  final Widget activeIcon;

  // 未选中时的图标
  final Widget inactiveIcon;

  StarRating({
    super.key,
    required this.rating,
    this.maxRating = 10.0,
    this.starCount = 5,
    this.starSize = 30.0,
    Color? activeColor,
    Color? inactiveColor,
    Widget? activeIcon,
    Widget? inactiveIcon,
  }) : activeColor = activeColor ?? Colors.redAccent,
       inactiveColor = inactiveColor ?? Color(0xFFBBBBBB),
       inactiveIcon =
           inactiveIcon ??
           Icon(Icons.star_border, color: Color(0xFFBBBBBB), size: starSize),
       activeIcon =
           activeIcon ??
           Icon(Icons.star, color: Colors.redAccent, size: starSize);

  @override
  State<StarRating> createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(mainAxisSize: MainAxisSize.min, children: buildInactiveStar()),
        Row(mainAxisSize: MainAxisSize.min, children: buildActiveStar()),
      ],
    );
  }

  // 获取未选择的星星组件
  List<Widget> buildInactiveStar() =>
      List.generate(widget.starCount, (int index) => widget.inactiveIcon);

  // 获取评分的星星组件
  List<Widget> buildActiveStar() {
    // 总评分的星星数组
    List<Widget> activeStarList = [];

    // 每颗星星所代表的分数
    double starRatingPer = widget.maxRating / widget.starCount;

    // 获取评分的整数部分
    final entireRating = (widget.rating / starRatingPer).floor();

    // 加入总评分的星星数组
    for (int i = 0; i < entireRating; i++) {
      activeStarList.add(widget.activeIcon);
    }

    final floatStar = getLeftStar();
    // 加入小数部分代表的星星
    activeStarList.add(floatStar);

    return activeStarList;
  }

  // 获取裁剪后的星星
  Widget getLeftStar() {
    // 每颗星星所代表的分数
    double starRatingPer = widget.maxRating / widget.starCount;
    // 获取评分的整数部分
    final entireRating = (widget.rating / starRatingPer).floor();
    // 获取评分的小数部分
    final floatRating = (widget.rating / starRatingPer) - entireRating;
    // 计算裁切的宽度
    final clipRectWidth = floatRating * widget.starSize;
    return ClipRect(
      clipper: AppCustomerClipper(clipRectWidth),
      child: widget.activeIcon,
    );
  }
}

class AppCustomerClipper extends CustomClipper<Rect> {
  // 裁切的宽度
  final double clipWidth;

  const AppCustomerClipper(this.clipWidth);

  // 裁切的组件
  @override
  Rect getClip(Size size) => Rect.fromLTRB(0, 0, clipWidth, size.height);

  @override
  bool shouldReclip(AppCustomerClipper oldClipper) =>
      clipWidth != oldClipper.clipWidth;
}
