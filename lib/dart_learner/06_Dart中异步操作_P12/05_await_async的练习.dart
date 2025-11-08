main(List<String> args) {
  print("main is starting...");

  getData();

  print("main is ending...");
}

void getData() async {
  // 第一次发起网络请求
  // getNetworkData("zhou")
  //     .then((res) {
  //       print("第一次的返回结果: $res");
  //       return getNetworkData(res);
  //     })
  //     .then((res) {
  //       print("第二次的返回结果: $res");
  //       return getNetworkData(res);
  //     })
  //     .then((res) {
  //       print("第三次的返回结果: $res");
  //     });

  // async await
  final res1 = await getNetworkData("zhou");
  print("第一次的返回结果: $res1");
  final res2 = await getNetworkData(res1);
  print("第二次的返回结果: $res2");
  final res3 = await getNetworkData(res2);
  print("第三次的返回结果: $res3");
}

// 网络请求
Future getNetworkData(String params) {
  return Future(() async {
    // 模拟网络延迟
    await Future.delayed(const Duration(seconds: 2));
    return "Hello world --- $params";
  });
}
