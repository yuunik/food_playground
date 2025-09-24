main(List<String> args) {
  /// 1. 定制字符串
  var str1 = 'abc';
  var str2 = "abc";
  /// 三引号可以实现换行效果
  var str3 = '''abc''';
  var str4 = """abc
  ddd
  dddc
  blasd
  """;

  print(str4);

  /// 2. 字符串和表达式进行拼接
  var name = "why";
  var age = 10;
  var height = 1.88;

  /// 强调: ${变量}, 那么 {} 可以省略
  var msg1 = "my name is $name, age is ${age}, height is ${height}";
  var msg2 = "name is $name, type is ${name.runtimeType}";
  print(msg1);
  print(msg2);
}
