main(List<String> args) {
  /// 1. 基础 for 循环
  for (var i = 0; i < 10; i++) {
    print(i);
  }

  /// 2. 遍历数组
  const names = ["why", "cba", "nba"];
  for (var i = 0; i < names.length; i++) {
    print(names[i]);
  }

  /// 3. 简便
  for (var name in names) {
    print(name);
  }
}