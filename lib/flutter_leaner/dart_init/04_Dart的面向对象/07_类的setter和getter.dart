main(List<String> args) {
  final person = Person();

  /// 直接访问属性
  person.name = "why";
  print(person.name);

  final person2 = Person();

  person2.setName = "chow";
  print(person2.getName);
}

class Person {
  late String name;

  /// setter
  // set setName(String name) {
  //   this.name = name;
  // }
  set setName(String name) => this.name = name;

  /// getter
  // String get getName {
  //   return name;
  // }
  String get getName => name;
}
