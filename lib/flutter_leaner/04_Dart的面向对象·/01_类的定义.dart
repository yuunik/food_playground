main(List<String> args) {
  final p = Person("yuunik", 18);
}

class Person {
  late String name;
  late int age;

  /// 构造器完整写法
  // Person(String name, int age) {
  //   this.name = name;
  //   this.age = age;
  // }

  /// 构造器语法糖
  Person(this.name, this.age);
}