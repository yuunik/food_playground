import 'package:flutter/material.dart';

class AppUnknownPage extends StatelessWidget {
  const AppUnknownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Unknown Page")),
      body: Center(child: Text("Unknown Page")),
    );
  }
}
