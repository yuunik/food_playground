import 'package:flutter/material.dart';
import 'package:food_playground/flutter_learner/_07_state_P16/view_model/counter_view_model.dart';
import 'package:food_playground/flutter_learner/_07_state_P16/view_model/privoder_manager.dart';
import 'package:food_playground/flutter_learner/_07_state_P16/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

/// 1. 创建自己需要共享的数据
/// 2. 在应用程序中的顶层创建 ChangeNotifierProvider
/// 3. 在其他位置使用共享位置
///    * Provider.of: 当 Provider 中的数据发生改变时, Provider.of 所在的 Widget 整个 build 方法都会重新构建
///    * Consumer(相对推荐): 当 Provider 中的数据发生改变时, 只会重新执行 Consumer 中的 build 方法
///    * Selector:
///         1. selector 方法(作用: 对原有的数据进行转换)
///         2. shouldRebuild(作用: 要不要重新构建)
main() => runApp(MultiProvider(providers: providerList, child: MyApp()));

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
    appBar: AppBar(title: Text("InheritedWidget")),
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomepageStatelessContent(),
          HomepageStatefulContent(),
          UserInfoPage(),
        ],
      ),
    ),
    floatingActionButton: Selector<CounterViewModel, CounterViewModel>(
      selector: (BuildContext context, CounterViewModel counterVM) => counterVM,
      shouldRebuild: (CounterViewModel oldVM, CounterViewModel newVM) => false,
      builder:
          (BuildContext context, CounterViewModel counterVM, Widget? child) =>
              FloatingActionButton(
                onPressed: () => setState(() {
                  counterVM.counter++;
                }),
                child: child,
              ),
      child: Icon(Icons.add),
    ),
  );
}

class HomepageStatelessContent extends StatelessWidget {
  const HomepageStatelessContent({super.key});

  @override
  Widget build(BuildContext context) {
    // int counter = context.watch<CounterViewModel>().counter;
    int counter = Provider.of<CounterViewModel>(context).counter;
    return Container(
      color: Colors.redAccent,
      child: Text("容器一计算: $counter", style: TextStyle(fontSize: 30)),
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
    return Container(
      color: Colors.blueAccent,
      child: Consumer<CounterViewModel>(
        builder:
            (BuildContext context, CounterViewModel counterVM, Widget? child) =>
                Text(
                  "容器二计算:  ${counterVM.counter}",
                  style: TextStyle(fontSize: 30),
                ),
      ),
    );
  }
}

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer2<CounterViewModel, UserViewModel>(
      builder:
          (
            BuildContext context,
            CounterViewModel counterVM,
            UserViewModel userVM,
            Widget? child,
          ) => Text(
            "该用户姓名为: ${userVM.userInfo.nickname}, 当前计数为: ${counterVM.counter}",
            style: TextStyle(fontSize: 30),
          ),
    );
  }
}
