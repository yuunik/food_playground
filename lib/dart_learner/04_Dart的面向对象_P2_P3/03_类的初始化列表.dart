import 'dart:ui';

import 'package:flutter/material.dart';

main(List<String> args) {
  final person1 = Person('yuunik');
}

const temp = 20;

class Person {
  String name;
  int age;

  /// 初始化列表
  Person(this.name, {int? age}) : age = temp > 20 ? 30 : 50;
}
