import 'package:flutter/material.dart';

class ImagePreview extends StatelessWidget {
  final String networkImg;

  const ImagePreview(this.networkImg, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Center(
          child: Hero(
            tag: networkImg,
            child: Image.network(networkImg, fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
