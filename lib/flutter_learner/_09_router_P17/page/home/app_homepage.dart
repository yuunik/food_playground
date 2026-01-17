import 'package:flutter/material.dart';

class AppHomepage extends StatelessWidget {
  static String routeName = "/";

  const AppHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("App Homepage")),
      body: Center(child: Text("body")),
    );
  }
}
