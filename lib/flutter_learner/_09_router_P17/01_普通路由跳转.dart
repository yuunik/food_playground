import 'package:flutter/material.dart';
import 'package:food_playground/flutter_learner/_09_router_P17/page/detail/app_detail_page.dart';

/// 路由管理主要有两个类: Route 和 Navigator
///   *** 一个页面要想被路由统一管理, 必须被包装为一个 Route.
///       但是 Route 是一个抽象类, 需要让其子类实现
///       常用 MaterialPageRoute
///       **
///         它在 Android 平台中, 打开一个页面会从屏幕底部滑动至屏幕的顶部, 关闭页面时从顶部滑动至底部消失
///         在 IOS 平台中, 打开一个页面会从屏幕右侧滑动至屏幕的左侧, 关闭页面时从左侧滑动至右侧消失
///   *** Navigator: 它是管理所有的 Route 的 Widget , 通过一个 Stack 来进行管理
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
  String _detailMsg = "";

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: Text("Router")),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          if (_detailMsg.isNotEmpty)
            Text(_detailMsg, style: TextStyle(fontSize: 30)),
          ElevatedButton(
            onPressed: () => _jumpToDetailPage(context),
            child: Text("详情页"),
          ),
        ],
      ),
    ),
  );

  void _jumpToDetailPage(BuildContext context) async {
    /// 1: 普通路由跳转
    /// 传递参数: 通过构造器直接传参即可
    // 方式一
    // Navigator.of(context).push(
    //   MaterialPageRoute(builder: (BuildContext context) => AppDetailPage()),
    // );
    // 方式二
    final String? res = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) =>
            AppDetailPage(msg: "Hello, my friend!"),
      ),
    );

    if (res != null) {
      setState(() {
        _detailMsg = res;
      });
    }
  }
}
