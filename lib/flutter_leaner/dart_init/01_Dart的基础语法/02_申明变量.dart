main(List<String> args) {
  /// 1. 明确申明
  String name = "zhou";

  /// 2. 类型推导
  /// 类型推导的方式虽然没有明确地指定变量的类型, 但是变量是有自己的明确类型
  /// 2.1 var 声明变量
  var age = 20;

  /// 如下所示, age 的类型为 int, 此时再赋值 String, 则会报错
  // age = "abc";
  age = 30;

  /// 2.2 final 声明常量
  final height = 1.88;

  /// 此时再给其赋值, 则会报错
  // height = 2.00;

  /// 2.3 const 声明常量
  const address = "厦门市";

  /// 此时再给其赋值, 则会报错
  // address = "北京市";

  /// 2.4 final 和 const 的区别
  /// const 必须赋常量值, (编译期间需要有一个确定的值)
  /// final 可以通过计算/函数获取一个值 (运行期间来确定一个值)

  /// const date = DateTime.now(); 语法错误
  final date = DateTime.now();

  /// final 用的更多一点
  ///
  /// p1 和 p2 不是同一个对象
  final p1 = Person("why");
  final p2 = Person("why");
  print(identical(p1, p2));

  const person1 = Person("zhangsan");
  const person2 = Person("zhangsan");
  print(identical(person1, person2));
}

class Person {
  final String name;

  const Person(this.name);
}
