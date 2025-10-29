main(List<String> args) {
  test(bar);

  /// 匿名函数
  test(() {
    print("匿名函数被调用");
  });

  /// 箭头函数: 语法条件, 函数体只有一行代码
  test(() => print("箭头函数被调用"));
}

/// 函数可以作为另一个函数的参数
void test(Function foo) {
  foo();
}

void bar() {
  print("bar 函数被调用");
}