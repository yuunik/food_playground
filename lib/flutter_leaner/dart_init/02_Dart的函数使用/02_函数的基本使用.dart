main(List<String> args) {
  sayHello1("zhangsan");

  sayHello2("lisi", 18, 1.88);

  sayHello3("wangwu", age: 18, height: 1.88);
}

/// 必传参数: 必须传
void sayHello1(String name) {
  print(name);
}

/// dart 中没有函数的位置
/// 可选参数: 位置可选参数 - 命名可选参数
/// ps: 只有可选参数, 才可以有默认值
/// 位置可选参数: [int age, double height]
/// 实参和形参在进行匹配时, 是根据位置匹配的
void sayHello2(String name, [int age = 0, double height = 0]) {
  print("姓名为 $name, 年龄为 $age, 身高为 $height");
}

/// 命名可选参数
void sayHello3(String name, { int age = 0, double height = 0 }) {
  print("姓名为 $name, 年龄为 $age, 身高为 $height");
}