import 'dart:io';

main(List<String> args) {
  print("main start ------");
  Future(() {
        // 发送第一次的网络请求
        print("输结果 -------");
        sleep(const Duration(seconds: 1));
        // throw Exception("第一次的错误");
        return "第一次的结果";
      })
      .then((res) {
        // 发送第二次的网络请求
        print(res);
        sleep(const Duration(seconds: 2));
        return "第二次的结果";
      })
      .then((res) {
        // 发送第三次的网络请求
        print(res);
        sleep(const Duration(seconds: 3));
        return "第三次的结果";
      })
      .then((res) => print(res))
      .catchError((err) {
        print("捕获异常 ----------------");
        print(err);
      });
  print("main end ------");
}
