/**
 * 1. 补充一: as 关键字用于给库起别名
 * 2. 补充二: 默认情况下, 下载并导入一个库时, 导入这个库中的所有的公共属性和方法
 * 3. 补充三: show 可以执行要导入的内容, hide 隐藏某个要导入的内容, 导入其他内容
 * 4. 公共的 dart 文件的抽取: export
 */

/// as 关键字用于给库起别名
// import 'package:food_playground/flutter_leaner/05_Dart%E4%B8%AD%E5%BA%93%E7%9A%84%E4%BD%BF%E7%94%A8/utils/math_utils.dart'
//     as mathUtil;

/// show 可以执行要导入的内容
// import 'package:food_playground/flutter_leaner/05_Dart%E4%B8%AD%E5%BA%93%E7%9A%84%E4%BD%BF%E7%94%A8/utils/math_utils.dart' show sum1;

/// hide 隐藏某个要导入的内容, 导入其他内容
// import 'package:food_playground/flutter_leaner/05_Dart%E4%B8%AD%E5%BA%93%E7%9A%84%E4%BD%BF%E7%94%A8/utils/date_utils.dart';
// import 'package:food_playground/flutter_leaner/05_Dart%E4%B8%AD%E5%BA%93%E7%9A%84%E4%BD%BF%E7%94%A8/utils/math_utils.dart'
//     hide mul2;

import 'package:food_playground/flutter_leaner/05_Dart%E4%B8%AD%E5%BA%93%E7%9A%84%E4%BD%BF%E7%94%A8/utils/utils.dart';

main(List<String> args) {
  print(sum1(209, 30));
  print(sum(20, 30));
  // print(mathUtil.mul(29, 29));
  print(getCurrentDate());
}

int sum(int number1, int number2) {
  return number1 + number2;
}
