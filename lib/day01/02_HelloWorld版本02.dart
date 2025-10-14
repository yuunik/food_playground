import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Hello World",
        style: TextStyle(fontSize: 40, color: Colors.orange),
      ),
    );
  }
}
