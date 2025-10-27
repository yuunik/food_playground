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
    return Container(
      width: 200,
      height: 200,
      alignment: Alignment(-1, -0.5),
      padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(10.0),
      transform: Matrix4.rotationZ(50),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.green,
          width: 5,
          style: BorderStyle.solid,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.orange,
            offset: Offset(10, 10),
            spreadRadius: 5,
            blurRadius: 10,
          ),
          BoxShadow(
            color: Colors.green,
            offset: Offset(-10, 10),
            spreadRadius: 5,
            blurRadius: 10,
          ),
        ],
      ),
      child: Icon(Icons.favorite, color: Colors.white, size: 20),
    );
  }
}

class PaddingDemo extends StatelessWidget {
  const PaddingDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        "Hello world",
        style: TextStyle(fontSize: 30, backgroundColor: Colors.red),
      ),
    );
  }
}

class AlignDemo extends StatelessWidget {
  const AlignDemo({super.key});

  @override
  Widget build(BuildContext context) {
    /// Alignment(-1, -1) 的 中心点为 (0, 0), y 轴向下, x 轴向右
    return Align(alignment: Alignment(-1, -1), child: Icon(Icons.favorite));
  }
}
