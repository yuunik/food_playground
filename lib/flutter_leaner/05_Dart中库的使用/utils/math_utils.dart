int sum1(int number1, int number2) {
  return number1 + number2;
}

int mul1(int number1, int number2) {
  return number1 * number2;
}

int mul2(int number1, int number2) {
  return number1 * number2;
}

/// _ 是区分私有和公有的一种方式
int _min(int number1, int number2) {
  return number1 > number2 ? number1 : number2;
}
