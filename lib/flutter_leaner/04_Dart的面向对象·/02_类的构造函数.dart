main(List<String> args) {
  final p = Person.withNameAgeHeight("zhangsan", 18, 1.87);

  /**
   *  Object 和 dynamic 的区别
   */
  /// 父类引用指向子类对象
  /// Object 调用方法时, 编译时会报错
  // Object obj = "chorria";
  // print(obj.substring(1));

  /// dynamic 的类型定义是一种明确的定义, var 的类型定义是一种类型推导
  /// dynamic 调用方法时, 编译时不报错, 但是运行时会存在安全隐患
  dynamic obj = "chorria";
  print(obj.substring(1));

  final p1 = Person.fromMap({
    "name": "wangwu",
    "age": 18,
    "height": 1.88
  });

  print(p1);
}

class Person {
  late String name;

  late int age;

  late double height;

  Person(this.name, this.age);

  /// 命名构造函数
  Person.withNameAgeHeight(this.name, this.age, this.height);

  Person.fromMap(Map<String, dynamic> map) {
    this.name = map["name"];
    this.age = map["age"];
    this.height = map["height"];
  }

  @override
  String toString() {
    return '姓名为 $name, 年龄为 $age, 身高为 $height';
  }
}