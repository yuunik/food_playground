import 'dart:math';

import 'package:flutter/material.dart';

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
  /// initialScrollOffset 为初始滚动位置
  ScrollController _scrollController = ScrollController(
    initialScrollOffset: 300,
  );

  bool _isShowButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        ///  _scrollController.offset 为滚动的位置
        _isShowButton = _scrollController.offset >= 1000;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /**
     * 两种方式可以监听:
     *  controller:
     *    1. 可以设置默认值 offset
     *    2. 监听滚动, 也可以监听滚动位置, 但它无法监听开始滚动和结束滚动
     *  NotificationListener:
     *    1. 可以监听开始滚动和结束滚动
     */
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listening scroll Demo"),
        centerTitle: true,
      ),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 200,
        itemBuilder: (BuildContext context, int index) => ListTile(
          leading: Icon(Icons.people),
          trailing: Icon(Icons.delete),
          title: Text("联系人$index"),
          subtitle: Text("手机号码: 134433443321"),
        ),
      ),
      floatingActionButton: _isShowButton
          ? FloatingActionButton(
              onPressed: () {
                /// 有动画效果的回滚
                _scrollController.animateTo(
                  0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.linear,
                );

                /// 没有动画效果的回滚
                // _scrollController.jumpTo(0);
              },
              child: Icon(Icons.arrow_upward),
            )
          : null,
    );
  }
}
