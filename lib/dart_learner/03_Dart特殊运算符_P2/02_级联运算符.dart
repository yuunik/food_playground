main(List<String> args) {
  // final p = Person();
  // p.name = "yuunik";
  // p.run();
  // p.eat();

  final p = Person()
              ..name = "chorria"
              ..eat()
              ..run();
}

class Person {
  late String name;

  void run() {
    print("running");
  }

  void eat() {
    print("eating");
  }
}