main(List<String> args) {
  final personName1 = Person.withName("zhangsan");
  final personName2 = Person.withName("zhangsan");

  print(identical(personName1, personName2));

  final personColor1 = Person.withColor("red");
  final personColor2 = Person.withColor("red");
  print(identical(personColor1, personColor2));
}

/// 普通的构造函数: 会自动返回创建出来的对象, 不能手动地返回
/// 工厂构造函数最大的特点: 可以手动地返回一个对象
class Person {
  String name;

  String color;

  Person(this.name, this.color);

  // 名字缓存
  static final Map<String, Person> _nameCache = {};

  // 颜色缓存
  static final Map<String, Person> _colorCache = {};

  factory Person.withName(String name) {
    if (_nameCache.containsKey(name)) {
      return _nameCache[name] as Person;
    } else {
      final person = Person(name, "default");
      _nameCache[name] = person;
      return _nameCache[name] as Person;
    }
  }

  factory Person.withColor(String color) {
    if (_colorCache.containsKey(color)) {
      return _colorCache[color] as Person;
    } else {
      final person = Person("default", color);
      _colorCache[color] = person;
      return _colorCache[color] as Person;
    }
  }
}
