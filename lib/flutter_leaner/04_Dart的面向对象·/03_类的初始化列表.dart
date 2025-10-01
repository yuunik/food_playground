import 'dart:ui';

import 'package:flutter/material.dart';

main(List<String> args) {
  final person1 = Person('yuunik');
}

class Person {
  String name;
  int age;
  final Color ageColor;

  /// 初始化列表
  Person(this.name, {int? age, Color? ageColor})
    : age = age ?? 10,
      ageColor = ageColor ?? Colors.red;
}
