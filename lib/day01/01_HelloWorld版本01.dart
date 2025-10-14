import 'package:flutter/material.dart';

main() {
  /// 1. runApp 函数
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text("第一个 Flutter 程序")),
        body: Center(
          child: Text(
            "Hello World",
            style: TextStyle(fontSize: 40, color: Colors.orange),
          ),
        ),
      ),
    ),
  );
}
