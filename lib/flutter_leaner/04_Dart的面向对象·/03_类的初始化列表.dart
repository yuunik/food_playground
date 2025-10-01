main(List<String> args) {
  final person1 = Person()
                      ..name = 'yuunik';
}

class Person {
  final String name;
  final int age;

  /// 初始化列表
  Person(this.name, { int age }): this.age = age ?? 10 {}
}