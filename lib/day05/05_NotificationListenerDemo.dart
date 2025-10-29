import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const AppHomePage());
  }
}

class AppHomePage extends StatefulWidget {
  const AppHomePage({super.key});

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage> {
  @override
  Widget build(BuildContext context) {
    /**
     * 两种方式可以监听:
     *  controller:
     *    1. 可以设置默认值 offset
     *    2. 监听滚动, 也可以监听滚动位置, 但它无法监听开始滚动和结束滚动
     *  NotificationListener:
     *    1. 可以监听开始滚动和结束滚动
     */
    return Scaffold(
      appBar: AppBar(
        title: const Text("Listening scroll Demo"),
        centerTitle: true,
      ),
      body: NotificationListener(
        /// 传入参数为一个泛型, 想监听啥, 就传啥
        /// 因为我们这里监听滚动条的滚动, 则传入 ScrollNotification ?
        onNotification: (ScrollNotification notification) {
          /// 如果需要向上冒泡通知, 则返回 false; 否则返回 true
          if (notification is ScrollStartNotification) {
            print("开始滚动...");
          } else if (notification is ScrollUpdateNotification) {
            print(
              "正在滚动..., 总滚动的距离为: ${notification.metrics.maxScrollExtent}, 当前滚动的位置为: ${notification.metrics.pixels}",
            );
          } else if (notification is ScrollEndNotification) {
            print("滚动结束");
          }
          return true; // 表示不需要向上冒泡通知
        },
        child: ListView.builder(
          itemCount: 200,
          itemBuilder: (BuildContext context, int index) => ListTile(
            leading: Icon(Icons.people),
            trailing: Icon(Icons.delete),
            title: Text("联系人$index"),
            subtitle: Text("手机号码: 134433443321"),
          ),
        ),
      ),
    );
  }
}
