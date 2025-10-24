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
      body: AppHomePageContent(),
    );
  }
}

/// StatelessWidget 的生命周期
// class AppHomePageContent extends StatelessWidget {
//   AppHomePageContent({super.key}) {
//     print("AppHomePageContent constructor");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print("AppHomePageContent build");
//     return Center(child: Text("Hello, world!"));
//   }
// }

class AppHomePageContent extends StatefulWidget {
  final String msg;

  AppHomePageContent({super.key, String? msg}) : msg = msg ?? 'initData' {
    print("1 ==> AppHomePageContent constructor");
  }

  @override
  State<AppHomePageContent> createState() {
    print("2 ==> AppHomePageContent createState");
    return _AppHomePageContentState();
  }
}

class _AppHomePageContentState extends State<AppHomePageContent> {
  int _sum = 0;

  _AppHomePageContentState() {
    print("3 ==> _AppHomePageContentState constructor");
  }

  @override
  void initState() {
    /// 强调: 必须调用 super
    /// 1. 父类会帮助进行初始化
    /// 2. 如果不调用, 会报错;
    ///   其继承的父类的initState 方法有@mustCallSuper注释,
    ///   该注释要求子类在实现完自身的 initState 方法后, 必须调用 super.initState();
    super.initState();
    print("4 ==> _AppHomePageContentState initState");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("update ==> _AppHomePageContentState didChangeDependencies");
  }

  @override
  void didUpdateWidget(covariant AppHomePageContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("update222 ==> _AppHomePageContentState didUpdateWidget");
  }

  @override
  void dispose() {
    /// 强调: 必须调用 super
    /// 1. 父类会帮助进行初始化
    /// 2. 如果不调用, 会报错;
    ///   其继承的父类的initState 方法有@mustCallSuper注释,
    ///   该注释要求子类在实现完自身的 initState 方法后, 必须调用 super.initState();
    super.dispose();
    print("6 ==> _AppHomePageContentState dispose");
  }

  @override
  Widget build(BuildContext context) {
    print("5 ==> _AppHomePageContentState build");
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          _getButtonList(),
          Text("当前计数为: $_sum", style: TextStyle(fontSize: 25)),
          Text("当前接收到的信息为: ${widget.msg}"),
        ],
      ),
    );
  }

  Widget _getButtonList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => setState(() {
            _sum++;
          }),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepOrange, // 设置背景色
          ),
          child: Text("+", style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
        ElevatedButton(
          onPressed: () => setState(() {
            _sum--;
          }),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
          child: Text("-", style: TextStyle(fontSize: 20, color: Colors.white)),
        ),
      ],
    );
  }
}

/// counter
/// 运行一个 Flutter 项目:
/// 1. 冷启动 (从零启动, 通常需要很久的时间)
/// 2. 热重载 (最主要是执行 build 方法)
/// 3. 热重启 (重新运行整个 App, 重新执行 main 方法)
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//
//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.
//
//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//
//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
