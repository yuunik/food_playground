main(List<String> args) {}

/// 注意一: 抽象类不能实例化
abstract class Shape {
  int getArea();

  String getInfo() {
    return "形状";
  }

  // factory Shape() {
  //   return Rectangle();
  // }

  /// external 关键字的作用: 将方法的声明和方法的实现分离
  // external factory Shape();

  /// 需要工厂构造函数，或者想让 Shape 可以被正常继承，那就给它加一个普通的构造函数。
  Shape();
}

/// 注意二: 继承抽象类后, 必须实现抽象类的抽象方法
class Rectangle extends Shape {
  Rectangle();

  @override
  int getArea() {
    // TODO: implement getArea
    return 100;
  }
}
