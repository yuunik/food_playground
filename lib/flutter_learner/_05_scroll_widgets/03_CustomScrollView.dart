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

class AppHomePage extends StatelessWidget {
  const AppHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: const Text("Sliver Demo")),
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
    return CustomScrollView02();
  }
}

class CustomScrollView02 extends StatelessWidget {
  const CustomScrollView02({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          // title: Text("Hello, sliver~"),
          expandedHeight: 300,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text("Welcome~"),
            background: Image.asset(
              "assets/images/welcome.png",
              fit: BoxFit.fill,
            ),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.all(8.0),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) => Container(
                color: Color.fromRGBO(
                  Random().nextInt(256),
                  Random().nextInt(256),
                  Random().nextInt(256),
                  1,
                ),
              ),
              childCount: 20,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1.5,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => ListTile(
              leading: Icon(Icons.people),
              trailing: Icon(Icons.delete),
              title: Text("联系人$index", style: TextStyle(fontSize: 24)),
              subtitle: Text(
                "电话号码: 13${index}4${index}6${index}3${index}1$index",
              ),
            ),
            childCount: 20,
          ),
        ),
      ],
    );
  }
}

class CustomScrollViewDemo01 extends StatelessWidget {
  const CustomScrollViewDemo01({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        /// SliverSafeArea 可以让内容在安全区内显示,
        /// 当滚动至appbar时, 也能正常滚动至appbar中
        /// SafeArea 则不能实现该效果
        SliverSafeArea(
          /// SliverPadding 可以让内容在content区内显示,
          /// 当滚动至 padding 区时, 也能正常滚动至 padding 区中
          /// Padding 则不能实现该效果
          sliver: SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverGrid(
              /// delegate 可传入 SliverChildBuilderDelegate 和 SliverChildListDelegate
              /// SliverChildListDelegate: 给其多少个元素, 它就渲染多少个元素, 性能较差
              /// SliverChildBuilderDelegate: 给其多少个元素, 当元素出现在屏幕中时, 才渲染, 性能较高, 即有懒加载的特性
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) => Container(
                  color: Color.fromRGBO(
                    Random().nextInt(256),
                    Random().nextInt(256),
                    Random().nextInt(256),
                    1,
                  ),
                ),
                childCount: 100,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                childAspectRatio: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
