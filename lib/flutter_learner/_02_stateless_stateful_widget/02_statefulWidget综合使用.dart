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
      body: const AppHomePageContent(msg: "Hello, world!"),
    );
  }
}

/// Widget 是不加 _ , 因为是暴露给别人使用的
class AppHomePageContent extends StatefulWidget {
  final String msg;

  const AppHomePageContent({super.key, String? msg}) : msg = msg ?? 'initData';

  @override
  State<AppHomePageContent> createState() => _AppHomePageContentState();
}

/**
 * 为什么 Flutter 在设计的时候, StatefulWidget 的 build 方法放在 State 中
 * 而不是放在 StatefulWidget 中?
 *  1. build 出来的 Widget 是需要依赖 State 中的变量 (状态 / 数据)
 *  2. 在 Flutter 的运行过程中,
 *      Widget 是不断地销毁和创建的,
 *        当我们自己的状态发生改变时, 并不希望重新创建一个新的 State
 */

/// State 是加 _ , 因为状态这个类只是给 Widget 使用的
class _AppHomePageContentState extends State<AppHomePageContent> {
  int _sum = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      /// Column 的高度是整个主轴的高度
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          _getButtonList(),
          Text("当前计数为: $_sum", style: TextStyle(fontSize: 25)),

          /// 如果方法内没有同名变量, this 可以省略 ;
          /// 否则则不行
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
