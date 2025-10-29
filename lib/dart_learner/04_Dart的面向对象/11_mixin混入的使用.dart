main(List<String> args) {
  final person = SuperMan();
  person.eating();
  person.running();
  person.flying();
}

/// mixin的语法: 1. 定义可混入的类时, 不能用 class, 需要用mixin
/// 2. 使用 with 关键字进行混入
mixin Runner {
  void running() {
    print("running...");
  }
}

mixin Flyer {
  void flying() {
    print("flying....");
  }
}

class Animal {
  void eating() {
    print("动物正在吃东西");
  }

  void running() {
    print("正在跑步");
  }
}

class SuperMan extends Animal with Runner, Flyer {
  @override
  void eating() {
    // TODO: implement eating
    super.eating();
  }

  @override
  void flying() {
    // TODO: implement flying
    print("超人自己飞");
  }
}
