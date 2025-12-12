import 'package:flutter/material.dart';

/// 路由管理主要有两个类: Route 和 Navigator
///   *** 一个页面要想被路由统一管理, 必须被包装为一个 Route.
///       但是 Route 是一个抽象类, 需要让其子类实现
main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(home: AppHomepage());
}

class AppHomepage extends StatefulWidget {
  const AppHomepage({super.key});

  @override
  State<AppHomepage> createState() => _AppHomepageState();
}

class _AppHomepageState extends State<AppHomepage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("Gesture")),
    body: Center(child: Text("Hello, world!")),
  );
}
