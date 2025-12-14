import 'package:flutter/material.dart';

class AppDetailPage extends StatelessWidget {
  final String msg;

  const AppDetailPage({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool canPop, dynamic result) {
        // 防止重复执行或者死循环
        if (canPop) return;
        _backToHome(context);
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Details")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              Text(msg, style: TextStyle(fontSize: 30)),
              TextButton(
                onPressed: () => _backToHome(context),
                child: Text("返回首页"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _backToHome(BuildContext context) =>
      // 方式一
      Navigator.of(context).pop<String>("My detail msg");
  // 方式二
  // Navigator.pop(context);
}
