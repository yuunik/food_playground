main(List<String> args) {
  var flag = "abc";

  /// dart 中, 没有非零即真或非空即真的说法
  if (flag.isNotEmpty) {
    print("????????????");
  }
}