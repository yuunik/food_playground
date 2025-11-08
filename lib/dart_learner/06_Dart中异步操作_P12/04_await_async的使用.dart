import 'dart:io';

main(List<String> args) {
  print("main starting...");

  final result = getNetworkData().then((res) {
    print("then starting... $res");
  });
  print("得到的结果为 $result");

  print("main ending...");
}

// String getNetworkData() {
//   sleep(const Duration(seconds: 3));
//   return "Hello world";
// }

// Future getNetworkData() {
//   return Future(() {
//     sleep(const Duration(seconds: 3));
//     return "Hello World";
//   });
// }

/// 解决两个问题:
///  1. await 必须在 async 函数中才能使用
///  2. aysnc 函数返回的结果必须是一个 Future
Future getNetworkData() async {
  await Future.delayed(const Duration(seconds: 3));

  /// 直接返回一个非Future类型时,
  /// dart 会通过语法糖来包裹一个Future进行返回
  return "Hello World";
}
