main(List<String> args) {
  test((abc) {
    print(abc);
  });

  test2((num1, num2) {
    return num1 + num2;
  });

  var calculate = useCalculate();
  print(calculate(29, 1));
}

/// 封装 test 函数, 要求: 传入一个函数
void test(Function foo) {
  foo("zhangsan");
}

void test2(int foo(int num1, int num2)) {
  foo(20, 30);
}

typedef Calculate = int Function(int num1, int num2);

void test3(Calculate calc) {
  calc(20, 30);
}

Calculate useCalculate() {
  return (num1, num2) {
    return num1 + num2;
  };
}