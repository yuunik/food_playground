import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_playground/core/extension/int_fit.dart';

class HomePage extends StatelessWidget {
  // route name
  static const String routeName = "/home";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // 设置状态栏颜色为和 AppBar 一致
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromRGBO(53, 116, 240, 1), // 状态栏背景色
      statusBarIconBrightness: Brightness.light, // 状态栏图标颜色（浅色背景用亮色图标）
    ));
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        backgroundColor: const Color.fromRGBO(53, 116, 240, 1),
      ),
      body: Center(
        child: Text("HomePage", style: TextStyle( fontSize: 35.rpx ),),
      ),
    );
  }
}
