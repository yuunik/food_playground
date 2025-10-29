main(List<String> args) {}

/// Dart 没有哪一个关键字是来定义接口的
/// 没有这些关键字 interface / protocol
/// 默认情况下所有类都是隐式接口
/// Dart 只支持单继承
/// 当将一个类当作一个接口使用时, 那么实现这个接口的类, 必须实现这个接口中所有方法
class Runner {
  void running() {}
}

class Flyer {
  void flying() {}
}

class Animal {
  void eating() {
    print("动物正在吃东西");
  }

  void running() {}
}

class SuperMan extends Animal implements Runner, Flyer {
  @override
  void eating() {
    // TODO: implement eating
    super.eating();
  }

  @override
  void flying() {
    // TODO: implement flying
  }

  /// 若继承的方法已有 running 方法,
  /// 则可以不用单独去实现
  // @override
  // void running() {
  //   // TODO: implement running
  // }
}
