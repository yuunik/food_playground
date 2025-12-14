import 'package:flutter/material.dart';

class AppAboutPage extends StatelessWidget {
  static String routeName = "/about";

  const AppAboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) {
        if (didPop) return;
        _backToHome(context);
      },
      child: Scaffold(
        appBar: AppBar(title: Text("About")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("About"),
              ElevatedButton(
                onPressed: () => _backToHome(context),
                child: Text("回到首页"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _backToHome(BuildContext context) =>
      Navigator.pop(context, "a msg from about page");
}
