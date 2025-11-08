import 'package:flutter/foundation.dart';

main(List<String> args) {
  Future.value("greating").then((res) {
    if (kDebugMode) {
      print(res);
    }
  });

  Future.error("bug is starting...").catchError((res) {
    if (kDebugMode) {
      print(res);
    }
  });

  Future.delayed(const Duration(seconds: 3), () {
        return "Hello flutter";
      })
      .then((res) {
        print(res);
        return "Greating hello";
      })
      .then((res) {
        print(res);
      });
}
