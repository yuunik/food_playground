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
    );
  }
}

/// StatelessWidget 的生命周期
// class AppHomePageContent extends StatelessWidget {
//   AppHomePageContent({super.key}) {
//     print("AppHomePageContent constructor");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print("AppHomePageContent build");
//     return Center(child: Text("Hello, world!"));
//   }
// }

class AppHomePageContent extends StatefulWidget {
  final String msg;

  AppHomePageContent({super.key, String? msg}) : msg = msg ?? 'initData' {
    print("1 ==> AppHomePageContent constructor");
  }

  @override
  State<AppHomePageContent> createState() {
    print("2 ==> AppHomePageContent createState");
    return _AppHomePageContentState();
  }
}

class _AppHomePageContentState extends State<AppHomePageContent> {
  int _sum = 0;

  _AppHomePageContentState() {
    print("3 ==> _AppHomePageContentState constructor");
  }

  @override
  void initState() {
    /// 强调: 必须调用 super
    /// 1. 父类会帮助进行初始化
    /// 2. 如果不调用, 会报错;
    ///   其继承的父类的initState 方法有@mustCallSuper注释,
    ///   该注释要求子类在实现完自身的 initState 方法后, 必须调用 super.initState();
    super.initState();
    print("4 ==> _AppHomePageContentState initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("update ==> _AppHomePageContentState didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant AppHomePageContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("update222 ==> _AppHomePageContentState didUpdateWidget");
  }

  @override
  void dispose() {
    /// 强调: 必须调用 super
    /// 1. 父类会帮助进行初始化
    /// 2. 如果不调用, 会报错;
    ///   其继承的父类的initState 方法有@mustCallSuper注释,
    ///   该注释要求子类在实现完自身的 initState 方法后, 必须调用 super.initState();
    super.dispose();
    print("6 ==> _AppHomePageContentState dispose");
  }

  @override
  Widget build(BuildContext context) {
    print("5 ==> _AppHomePageContentState build");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          _getButtonList(),
          Text("当前计数为: $_sum", style: TextStyle(fontSize: 25)),
          Text("当前接收到的信息为: ${widget.msg}"),
        ],
      ),
    );
  }

  Widget _getButtonList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => setState(() {
            _sum++;
          }),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange, // 设置背景色
          ),
          child: Text("+", style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
        ElevatedButton(
          onPressed: () => setState(() {
            _sum--;
          }),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
          child: Text("-", style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
      ],
    );
  }
}
