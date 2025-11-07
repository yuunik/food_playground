import 'dart:io';

main(List<String> args) {
  print("project start");

  /// 发送一个网络请求
  final future = getNetworkData();
  print("get my data ==> $future");

  /// 2. 拿到结果
  /// then 后面的回调函数什么时候被执行 ?
  ///   - 需要在 Future (函数) 有结果时, 才执行下面的回调函数
  future
      .then((String value) {
        print("获取到数据结果, $value");
      })
      .catchError((err) {
        print("执行错误信息111 ===> $err @@@@@@@@@@@@@@@");
      })
      .whenComplete(() {
        print("代码执行完成...");
      });

  future.catchError((err) {
    print("执行错误信息222 ===> $err @@@@@@@@@@@@@@@");
  });
  print("project end");
}

/// 模拟一个网络请求
// String getNetworkData() {
//   sleep(Duration(seconds: 5));
//   return "Hello world";
// }

/// Future 请求
Future<String> getNetworkData() {
  return Future<String>(() {
    /// 1. 将耗时的操作包裹在 Future 的回调函数中
    ///   - 1.1 只要有返回结果, 那么就执行 Future 对应的 then 的回调 (Promise - resolve)
    ///   - 1.2 如果没有结果返回 (有错误信息), 需要在 Future 回调中抛出一个异常 (Promise - reject)
    sleep(const Duration(seconds: 5));
    // return "Hello world";
    throw new Exception("I am error message");
  });
}
