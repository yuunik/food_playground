import 'dart:math';

import 'package:flutter/material.dart';
import 'package:food_playground/flutter_learner/_12_animation_P16/pages/modal_page.dart';

/// 页面路由转场方式
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
      body: Center(child: Text("Hello world")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// 页面路由转场方式一:
          /// iOS -> Modal 方式(从下面弹出的方式)跳转页面, MaterialPageRoute 只有从下弹出和从右弹出 这两种方式
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (BuildContext context) => ModalPage(),
          //     fullscreenDialog: true,
          //   ),
          // );

          /// 页面路由转场方式二:
          /// 一下子弹出的方式
          Navigator.of(context).push(
            PageRouteBuilder(
              /// 转场时间
              transitionDuration: Duration(seconds: 3),
              pageBuilder:
                  (
                    BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation,
                  ) => FadeTransition(opacity: animation, child: ModalPage()),
            ),
          );
        },
        child: Icon(Icons.leave_bags_at_home),
      ),
    );
  }
}
