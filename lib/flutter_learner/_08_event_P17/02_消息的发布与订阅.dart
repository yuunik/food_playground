import 'package:flutter/material.dart';
import 'package:food_playground/flutter_learner/_08_event_P17/util/global_event_bus.dart';

/// 消息的发布与订阅
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
    appBar: AppBar(title: Text("Event Bus")),
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        children: [AppButton(), AppText()],
      ),
    ),
  );
}

class AppButton extends StatelessWidget {
  const AppButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // 发送消息
        globalEventBus.fire("Hello, flutter!");
      },
      child: Text("发送消息"),
    );
  }
}

class AppText extends StatefulWidget {
  const AppText({super.key});

  @override
  State<AppText> createState() => _AppTextState();
}

class _AppTextState extends State<AppText> {
  late String _msg = "Hello, world";

  @override
  void initState() {
    super.initState();
    // 监听消息
    /// 它只监听事件总线是否有特定的值,
    /// 所以每次消息的发布与订阅,
    /// 都需要创建指定的model类
    /// 因为个人理解为, 这个类的类名就是我们发布的事件名
    /// 这个类中的信息就是订阅者往这个事件传递的值
    /// 因而, 这个类的类名命名最好为 XXXEvent 的形式, 例如 GetUserListEvent
    globalEventBus.on<String>().listen((val) {
      setState(() {
        _msg = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_msg, style: TextStyle(fontSize: 24));
  }
}
