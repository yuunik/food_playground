import 'package:flutter/material.dart';

class ImageDemo2 extends StatelessWidget {
  const ImageDemo2({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/welcome.png");
  }
}

class ImageDemo01 extends StatelessWidget {
  const ImageDemo01({super.key, required this.imageURL});

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Image(
      /// 颜色
      color: Colors.red,

      /// 颜色的混入模式
      colorBlendMode: BlendMode.colorDodge,
      repeat: ImageRepeat.repeatX,
      image: NetworkImage(imageURL),
      width: 200,
      height: 200,
      fit: BoxFit.contain,
      // alignment: Alignment.bottomCenter,
      alignment: Alignment(0, -2),
    );
  }
}
