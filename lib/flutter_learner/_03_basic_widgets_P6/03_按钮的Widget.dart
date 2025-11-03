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
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("FloatingActionButton click"),
        child: Icon(Icons.add),
      ),

      /// 按键位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class AppHomePageContent extends StatefulWidget {
  const AppHomePageContent({super.key});

  @override
  State<AppHomePageContent> createState() => _AppHomePageContentState();
}

class _AppHomePageContentState extends State<AppHomePageContent> {
  @override
  Widget build(BuildContext context) {
    return TextRichDemo();
  }
}

/// 必传参数和 required 的区别:
///   1. 必传参数不传就会报错 (编译不通过)
///   2. required 编译可以通过, 但是会报警告
class TextRichDemo extends StatelessWidget {
  const TextRichDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ButtonDemo();
  }
}

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 4.0,
      children: [
        /// 突起按键
        ElevatedButton(
          onPressed: () => print("ElevatedButton click"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple,
            foregroundColor: Colors.white,
          ),
          child: Text("ElevatedButton"),
        ),

        /// 文字按键
        TextButton(
          onPressed: () => print("TextButton click"),
          child: Text("TextButton"),
          style: TextButton.styleFrom(backgroundColor: Colors.orange),
        ),

        /// 外边框按键
        OutlinedButton(
          onPressed: () => print("OutlinedButton click"),
          child: Text("OutlinedButton"),
        ),

        /// 自定义按键
        TextButton(
          onPressed: () => print("DIY Button click"),
          style: TextButton.styleFrom(
            backgroundColor: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          child: Row(
            spacing: 4,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.favorite, color: Colors.red),
              Text("喜欢作者"),
            ],
          ),
        ),
      ],
    );
  }
}
