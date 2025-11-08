import 'dart:isolate';

/// 由于 Dart 是单线程的,
/// 这个线程有自己可以访问的内容空间以及需要运行的时间循环, 可以将这个空间称之为 Isolate
/// 比如 Flutter 中就有一个 Root Isolate, 负责运行 Flutter 的代码, 比如 UI 渲染\用户交互等
main(List<String> args) {
  print("main is starting...");
  // 创建 Isolate
  /// 在 Isolate 中 , 资源隔离做得非常好, 每个 Isolate 都有自己的 Event Loop 与 Queue
  ///  - Isolate 之前不共享任何资源, 只能依靠消息机制通信, 因此没有资源抢占的问题
  Isolate.spawn(calc, 100);

  print("main is over");
}

void calc(int count) {
  var total = 0;
  for (var i = 0; i < count; i++) {
    total += i;
  }
  print(total);
}
