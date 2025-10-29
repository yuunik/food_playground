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
      appBar: AppBar(title: const Text("列表测试")),
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
    return ListViewSeparatedDemo();
  }
}

class ListViewSeparatedDemo extends StatelessWidget {
  const ListViewSeparatedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return Text("Hello world: $index", style: TextStyle(fontSize: 30));
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          color: Color(0xFFCCCCCC),
          height: 10,
          indent: 30,
          endIndent: 30,
          // 线条高度
          thickness: 10,
        );
      },
      itemCount: 100,
    );
  }
}

class ListViewBuilderDemo extends StatelessWidget {
  const ListViewBuilderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    /// item 实际要被展示时,
    /// itemBuilder 才会被调用
    return ListView.builder(
      itemCount: 100,

      ///  元素高度
      itemExtent: 60,
      itemBuilder: (BuildContext context, int index) {
        return Text("Hello world: $index", style: TextStyle(fontSize: 30));
      },
    );
  }
}

class ListViewDemo01 extends StatelessWidget {
  const ListViewDemo01({super.key});

  @override
  Widget build(BuildContext context) {
    /// ListView 遇到多个子元素时,
    /// 会一次性加载所有元素,
    /// 性能较差
    return ListView(
      // scrollDirection: Axis.horizontal,
      // itemExtent: 100,
      // reverse: true,
      children: List.generate(100, (index) {
        return ListTile(
          leading: Icon(Icons.people),
          trailing: Icon(Icons.delete),
          title: Text("联系人 ${index + 1}"),
          subtitle: Text("电话号码: $index "),
        );
      }),
    );
  }
}
