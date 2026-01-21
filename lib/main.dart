import 'dart:ui';
import 'package:flutter/material.dart';

// 1. 【制造泄漏的源头】
// 定义一个全局的静态列表。静态变量的生命周期伴随整个 App，永远不会被销毁。
class LeakTrap {
  // 只要被添加进这个列表的对象，GC 都不敢回收
  static final List<Object> victims = [];
}

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => const MaterialApp(home: AppHomePage());
}

class AppHomePage extends StatelessWidget {
  const AppHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("内存泄漏练习场"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.white,
        centerTitle: true,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 4),
                blurRadius: 10.0,
                color: Colors.black.withOpacity(0.25),
              ),
            ],
          ),
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF181E2C).withOpacity(0.5),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purple, Colors.orange],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "当前是首页",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 15,
                  ),
                ),
                onPressed: () {
                  // 跳转到会发生泄漏的页面
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const LeakyPage()),
                  );
                },
                child: const Text(
                  "跳转去 '泄漏页' (多点几次)",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "操作指南：\n1. 打开 DevTools Memory\n2. 拍快照 (基准)\n3. 进泄漏页 -> 返回 (重复3次)\n4. 点 GC -> 拍快照 (对比)\n5. 查看 Diff",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 2. 【会泄漏的页面】
class LeakyPage extends StatefulWidget {
  const LeakyPage({super.key});

  @override
  State<LeakyPage> createState() => _LeakyPageState();
}

class _LeakyPageState extends State<LeakyPage> {
  // 为了让内存看起来更明显，我们搞一个占用内存的大数组
  // List.generate 100万个整数，大概占用 8MB 左右内存
  final List<int> heavyData = List.generate(1000000, (index) => index);

  @override
  void initState() {
    super.initState();
    print("LeakyPage Created: 正在制造泄漏...");

    // 3. 【致命代码】
    // 将当前页面状态 (this) 添加到全局静态列表 LeakTrap.victims 中。
    // 只要 LeakTrap 不被清空，_LeakyPageState 就永远无法被 GC 回收。
    LeakTrap.victims.add(this);
  }

  @override
  void dispose() {
    // 正常情况下，我们应该在这里把 this 从 LeakTrap 中移除
    // LeakTrap.victims.remove(this);
    // 但我故意不写，这就是泄漏的原因！
    print("LeakyPage Dispose 被调用 (但对象其实死不掉)");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("这是个坏页面")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("当前缓存了 ${heavyData.length} 条数据"),
            const SizedBox(height: 20),
            const Text("请点击左上角返回，或者直接侧滑返回"),
            const SizedBox(height: 20),
            Text(
              "当前已泄漏实例数: ${LeakTrap.victims.length}",
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
