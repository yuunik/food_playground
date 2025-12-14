import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_playground/flutter_learner/_10_animation_P18/pages/image_preview.dart';

/// 将需要执行动画的 Widget 放到一个 AnimatedWidget 中的 build 方法里进行返回
/// 缺点:
///   1.  每次都需要创建一个类
///   2.  如果构建的 Widget 有子类, 那么子类依旧会重复地不断构建, 即不断地执行 build 方法
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const AppHomePage());
  }
}

class AppHomePage extends StatefulWidget {
  const AppHomePage({super.key});

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero animation demo"), centerTitle: true),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 16 / 9,
        ),
        children: List.generate(
          100,
          (index) => InkWell(
            onTap: () {
              // 页面转场方式一:
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (BuildContext context) => ImagePreview(
              //       "https://picsum.photos/500/500?random=$index",
              //     ),
              //   ),
              // );

              // 页面转场方式二:
              Navigator.of(context).push(
                PageRouteBuilder(
                  /// 页面转场时间
                  transitionDuration: Duration(milliseconds: 250),
                  pageBuilder:
                      (
                        BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                      ) => FadeTransition(
                        opacity: animation,
                        child: ImagePreview(
                          "https://picsum.photos/500/500?random=$index",
                        ),
                      ),
                ),
              );
            },
            child: Hero(
              tag: "https://picsum.photos/500/500?random=$index",
              child: Image.network(
                "https://picsum.photos/500/500?random=$index",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
