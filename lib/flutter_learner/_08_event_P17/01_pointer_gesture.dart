import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(home: AppHomepage());
}

class AppHomepage extends StatefulWidget {
  const AppHomepage({super.key});

  @override
  State<AppHomepage> createState() => _AppHomepageState();
}

class _AppHomepageState extends State<AppHomepage> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("Gesture")),
    body: Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          GestureDetector(
            onTapDown: (details) {
              print("原组件被点击了");
            },
            child: Container(
              width: 200,
              height: 200,
              color: Colors.yellowAccent,
            ),
          ),
          IgnorePointer(
            child: GestureDetector(
              onTapDown: (details) {
                print("子组件被点击了");
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.greenAccent,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class GestureDemo extends StatelessWidget {
  const GestureDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) {
        print("手指按下");
        print(details.globalPosition);
        print(details.localPosition);
      },
      onTapDown: (details) {
        print("手指抬起");
      },
      onTap: () {
        print("手势点击");
      },
      onTapCancel: () {
        print("手指取消");
      },
      onDoubleTap: () {
        // 执行这个, 将不再监听tap事件
        print("手指双击");
      },
      onLongPress: () {
        // 执行这个
        print("手指长按");
      },
      child: Container(width: 200, height: 200, color: Colors.orangeAccent),
    );
  }
}

class ListenerDemo extends StatelessWidget {
  const ListenerDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (event) {
        print("指针按下: $event");
        print("当前位置为: ${event.position}");
        print("当前点击的位置为: ${event.localPosition}");
      },
      onPointerMove: (event) {
        // print("指针移动: $event");
      },
      onPointerUp: (event) {
        // print("指针抬起: $event");
      },
      child: Container(color: Colors.redAccent, width: 100, height: 100),
    );
  }
}
