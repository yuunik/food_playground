import 'package:flutter/material.dart';

void main() => runApp(MyApp());

/// Widget:
///  有状态的 Widget ==> StatefulWidget 在运行过程中有一些状态 (data) 需要改变
///  无状态的 Widget ==> StatelessWidget 内容是确定没有状态 (data) 的改变
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: AppHomePage());
  }
}

class AppHomePage extends StatelessWidget {
  const AppHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("第一个 Flutter 程序")),
      body: AppContentBody(),
    );
  }
}

/// 继承的抽象类中有注解 @protected,
/// 则说明该方法的实现体需要继承的该类自己实现
class AppContentBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppContentBodyState();
  }
}

/// 被 @immutable  注释的类或者其子类都必须是不可变的
/// StatefulWidget 和 StatelessWidget 都是继承带有 @immutable 注释的类的,
/// 则继承StatefulWidget 和 StatelessWidget 的类的成员变量也必须是 final 的
/// 因而所有的的Widget都不能定义状态, 只能定义状态的 Widget 定义状态
/// StatefulWidget 不能定义状态, 则只能创建一个单独的类, 由这个类负责维护状态
class AppContentBodyState extends State<AppContentBody> {
  var flag = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: flag,
            onChanged: (val) => setState(() {
              if (val != null) flag = val;
            }),
          ),
          Text("同意协议", style: TextStyle(fontSize: 30)),
        ],
      ),
    );
  }
}
