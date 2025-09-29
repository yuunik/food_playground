main(List<String> args) {
  /// 1. 列表 List: [];
  List nameList = ["abc", "cba", "nab", "nab"];

  /// 2. 集合 Set: {}
  var movieSet = {"星际穿越", "大话西游", "盗梦空间"};
  nameList = Set.from(nameList).toList();
  print(nameList);

  /// 3. 映射 Map
  var info = {"name": "why", "age": 18};
}
