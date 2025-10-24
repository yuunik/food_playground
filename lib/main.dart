import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const AppHomePage());
  }
}

class AppHomePage extends StatelessWidget {
  const AppHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("商品列表")),
      body: AppHomePageContent(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("FloatingActionButton click"),
        child: Icon(Icons.add),
      ),

      /// 按键位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class AppHomePageContent extends StatefulWidget {
  const AppHomePageContent({super.key});

  @override
  State<AppHomePageContent> createState() => _AppHomePageContentState();
}

class _AppHomePageContentState extends State<AppHomePageContent> {
  final imageURL = "https://picsum.photos/id/1/100/150";

  @override
  Widget build(BuildContext context) {
    /// 1. 在 Flutter 项目中创建一个文件夹, 存储图片
    /// 2. 在 pubspec.yaml 进行配置
    /// 3. 使用图片
    /// return Image(image: AssetImage("assets/images/welcome.png"));
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
