import 'package:flutter/material.dart';

class ImgView extends StatelessWidget {
  // 图片地址
  final String imgUrl;
  const ImgView({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Scaffold(
        backgroundColor: Color(0xFF000000),
        body: Center(
          child: Hero(
            tag: imgUrl,
            child: Image.network(imgUrl, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
