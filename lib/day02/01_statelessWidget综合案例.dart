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
      body: const AppHomePageContent(),
    );
  }
}

class AppHomePageContent extends StatelessWidget {
  const AppHomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        AppProduct(
          title: "Apple",
          desc: "desc",
          imageURL: 'https://picsum.photos/id/1/900/500',
        ),
        const SizedBox(height: 6),
        AppProduct(
          title: "Apple2",
          desc: "desc2",
          imageURL: 'https://picsum.photos/id/2/900/500',
        ),
        const SizedBox(height: 6),
        AppProduct(
          title: "Apple3",
          desc: "desc3",
          imageURL: 'https://picsum.photos/id/3/900/500',
        ),
      ],
    );
  }
}

// 子项
class AppProduct extends StatelessWidget {
  final String title;

  final String desc;

  final String imageURL;

  final titleStyle = const TextStyle(fontSize: 25, color: Colors.orange);
  final descStyle = const TextStyle(fontSize: 20, color: Colors.green);

  const AppProduct({
    super.key,
    required this.title,
    required this.desc,
    required this.imageURL,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(
          width: 5, // 设置边框的宽度
          color: Colors.pink, // 设置边框的颜色
        ),
      ),
      child: Column(
        spacing: 8.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: titleStyle),
          Text(desc, style: descStyle),
          Image.network(imageURL),
        ],
      ),
    );
  }
}
