import 'package:flutter/material.dart';

class AppCounterStore extends InheritedWidget {
  /// InheritedWidget 里的状态是无法直接修改的
  /// 只能不断地重新传入, 重新构建
  ///
  // 1. 共享的数据
  final int totalScore;

  // 2. 定义构造方法
  const AppCounterStore({
    super.key,
    required this.totalScore,
    required super.child,
  });

  // 3. 获取组件最近的当前 InheritedWidget
  static AppCounterStore? of(BuildContext context) =>
      // 沿着 Element 树, 去找到最近的指定类型的元素, 从 Element 中取到指定的 Widget 对象
      context.dependOnInheritedWidgetOfExactType<AppCounterStore>();

  // 4. 决定要不要回调 State 中的 didChangeDependencies
  // 当返回 true 时, 执行依赖当前的 InheritedWidget 的 State 中的 didChangeDependencies
  @override
  bool updateShouldNotify(AppCounterStore oldWidget) =>
      oldWidget.totalScore != totalScore;
}

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
  int _counter = 100;

  /// 当某个数据依赖 InheritedWidget 时,
  /// 而 InheritedWidget 中的数据发生改变时,
  /// 就会调用
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("执行了didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("InheritedWidget")),
    body: AppCounterStore(
      totalScore: _counter,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 20,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [HomepageStatelessContent(), HomepageStatefulContent()],
        ),
      ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () => setState(() {
        _counter++;
      }),
      child: Icon(Icons.add),
    ),
  );
}

class HomepageStatelessContent extends StatelessWidget {
  const HomepageStatelessContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.redAccent,
      child: Text(
        "容器一计算: ${AppCounterStore.of(context)?.totalScore}",
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}

class HomepageStatefulContent extends StatefulWidget {
  const HomepageStatefulContent({super.key});

  @override
  State<HomepageStatefulContent> createState() =>
      _HomepageStatefulContentState();
}

class _HomepageStatefulContentState extends State<HomepageStatefulContent> {
  @override
  Widget build(BuildContext context) {
    final store = AppCounterStore.of(context);
    return Container(
      color: Colors.blueAccent,
      child: Text(
        "容器二计算:  ${store?.totalScore}",
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}
