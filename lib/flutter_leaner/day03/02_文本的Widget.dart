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

class TextRichDemo extends StatelessWidget {
  const TextRichDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        // text: "Hello world",
        // style: TextStyle(fontSize: 30, color: Colors.red),
        children: [
          TextSpan(
            text: "Hello world",
            style: TextStyle(fontSize: 30, color: Colors.red),
          ),
          TextSpan(
            text: "Hello flutter",
            style: TextStyle(fontSize: 30, color: Colors.green),
          ),
          WidgetSpan(child: Icon(Icons.favorite, color: Colors.red)),
          TextSpan(
            text: "Hello dart",
            style: TextStyle(fontSize: 30, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}

class TextDemo extends StatelessWidget {
  const TextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "诸葛亮，字孔明，琅琊郡阳都县人。三国时期蜀汉丞相，亦是政治家、军事家、发明家及散文家，曾发明木牛流马、诸葛连弩等。他常被后世认为是智慧和忠义的典范。先为刘备麾下核心幕僚，后主刘禅早期蜀汉实际上的最高领导人。",
      textAlign: TextAlign.end,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      // textScaler: TextScaler.linear(1.5),  // 文字放大
      style: TextStyle(
        fontSize: 30,
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
