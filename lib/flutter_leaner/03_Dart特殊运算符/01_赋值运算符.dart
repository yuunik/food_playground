main(List<String> args) {
  /// 1. ??=
  /// 当原来的变量有值时, 那么 ??= 不执行
  /// 原来的变量为 null 时, 那么将值赋值给这个变量
  var name = "zhangsan";
  name ??= "lisi";
  print(name);

  /// 2. ??
  /// ?? 前面的数据有值时, 那么就使用  ?? 前面的数据
  /// ?? 前面的数据为 null 时, 那么就使用后面的值
  var name2 = "chorria";
  var temp = name2 ?? "lilei";
  print(temp);
}