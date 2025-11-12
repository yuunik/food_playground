import 'package:flutter/material.dart';

class MallPage extends StatelessWidget {
  const MallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MallPage")),
      body: Center(child: Text("MALL")),
    );
  }
}
