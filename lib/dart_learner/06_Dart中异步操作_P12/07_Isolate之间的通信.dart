import 'dart:isolate';

main(List<String> args) async {
  print("main is starting...");

  /// 创建管道
  ReceivePort _receivePort = ReceivePort();

  /// 创建 Isolate
  Isolate _isolte = await Isolate.spawn<SendPort>(foo, _receivePort.sendPort);

  /// 监听管道
  _receivePort.listen((msg) {
    print(msg);

    /// 收到信息后, 关闭管道
    _receivePort.close();

    // 关闭 isolate
    _isolte.kill();
  });

  print("main is end...");
}

/// Isolate 的单向通信
void foo(SendPort _sendPort) {
  return _sendPort.send("Hello, my friends!");
}
