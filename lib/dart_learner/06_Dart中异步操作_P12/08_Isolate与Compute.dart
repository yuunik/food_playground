import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:map_launcher/map_launcher.dart';

// 计算总数
int getTotal(int count) {
  int sum = 0;
  for (int i = 0; i < count; i++) {
    sum += i;
  }
  return sum;
}

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
  int _sum = 0;

  @override
  void initState() {
    super.initState();

    /// compute 函数可以将计算任务放到独立的 Isolate (隔离线程)中执行避免阻塞 UI 线程.
    /// compute 要求传入的函数必须是 顶层函数（top-level function） 或 静态函数（static function），
    /// 不能是实例方法或私有方法（即使你把它放在同一个类里）。
    /// 这是因为 compute 会在一个新的 isolate 中运行该函数，
    /// 而 isolate 之间不能共享对象引用（包括 this），
    /// 也无法访问类实例的私有成员。
    getMyIsolateSpare();
  }

  // compute
  Future getMyIsolateSpare() async {
    final result = await compute(getTotal, 100);
    print("总和结果为 $result");
    setState(() {
      _sum = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    // checkMap();
    return Scaffold(
      appBar: AppBar(title: Text("Hero animation demo"), centerTitle: true),
      body: Center(child: Text("当前的Compute运算结果为: $_sum")),
    );
  }
}
