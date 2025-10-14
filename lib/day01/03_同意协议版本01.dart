import 'package:flutter/material.dart';

/// 本版本的代码是有问题的
void main() => runApp(MyApp());

/// Widget:
///  有状态的 Widget ==> StatefulWidget 在运行过程中有一些状态 (data) 需要改变
///  无状态的 Widget ==> StatelessWidget 内容是确定没有状态 (data) 的改变
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: AppHomePage());
  }
}

class AppHomePage extends StatelessWidget {
  const AppHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("第一个 Flutter 程序")),
      body: AppContentBody(),
    );
  }
}

class AppContentBody extends StatelessWidget {
  const AppContentBody({super.key});

  /// 如果一个类继承的类有 @immutable, 那么则说明这个类不可变
  /// 因而, 定义的所有状态都应该是 final 类型
  final flag = true;

  /// 错误定义
  /// var flag = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(value: flag, onChanged: (val) => flag = val),
          Text("同意协议", style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
