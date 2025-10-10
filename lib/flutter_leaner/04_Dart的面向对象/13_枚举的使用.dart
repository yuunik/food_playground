main(List<String> args) {
  final currentColor = Colors.red;

  switch (currentColor) {
    case Colors.blue:
      print("当前使用蓝色");
      break;
    case Colors.red:
      print("当前使用红色");
      break;
    case Colors.green:
      print("当前使用绿色");
      break;
  }

  print(Colors.values);
  print(Colors.red.index);
}

enum Colors { red, green, blue }
