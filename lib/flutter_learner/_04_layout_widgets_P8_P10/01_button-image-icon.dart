import 'package:flutter/material.dart';

class IconExtensionDemo extends StatelessWidget {
  const IconExtensionDemo({super.key});

  @override
  Widget build(BuildContext context) {
    /// Icon 字体图标和图片图标
    /// 1. 字体图标为矢量图, 放大的时候不会失真
    /// 2. 字体图标可以设置颜色
    /// 3. 图标很多时, 占据空间更小
    // return Icon(Icons.pets, size: 300, color: Colors.orange);
    // return Icon(
    //   IconData(0xe4a1, fontFamily: 'MaterialIcons'),
    //   size: 300,
    //   color: Colors.orange,
    // );

    /// 1. 当使用 Text 去标识字体图标时, 应将字符串0xf0640 转为 Unicode 编码
    /// 2. 其次, 必须设置对应的字体
    return Text(
      "\uf0640",
      style: TextStyle(fontFamily: 'MaterialIcons', fontSize: 30),
    );
  }
}

/// 1. 占位图的问题: FadeInImage
/// 2. Image 是自己有做缓存的操作的, 最大 1000 张图片, 每张最大 100 MB, 可通过 ImageCache Class 去做对应的调整
class ImageExtensionDemo extends StatelessWidget {
  const ImageExtensionDemo({super.key, required this.imageURL});

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return FadeInImage(
      fadeOutDuration: Duration(milliseconds: 1),
      fadeInDuration: Duration(milliseconds: 1),
      placeholder: AssetImage("assets/images/welcome.png"),
      image: NetworkImage(imageURL),
    );
  }
}

class ButtonExtensionDemo extends StatelessWidget {
  const ButtonExtensionDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () => print("text button click"),
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1.0),
            ),
          ),
          child: Text("TextButton1"),
        ),
        ButtonTheme(
          minWidth: 30,
          height: 20,
          child: TextButton(
            onPressed: () => print("text button click"),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(1.0),
              ),
              padding: EdgeInsets.all(0),
            ),
            child: Text("TextButton2"),
          ),
        ),
      ],
    );
  }
}
