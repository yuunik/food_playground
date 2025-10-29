import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const AppHomePage());
  }
}

class AppHomePage extends StatelessWidget {
  const AppHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("商品列表")),
      body: AppHomePageContent(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => print("FloatingActionButton click"),
        child: Icon(Icons.add),
      ),

      /// 按键位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class AppHomePageContent extends StatefulWidget {
  const AppHomePageContent({super.key});

  @override
  State<AppHomePageContent> createState() => _AppHomePageContentState();
}

class _AppHomePageContentState extends State<AppHomePageContent> {
  final usernameTextEditController = TextEditingController();
  final passwordTextEditController = TextEditingController();

  // Color(0x00000000);
  // final color=  Color.fromARGB(a, r, g, b)
  // final color = Color.fromRGBO()

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primarySwatch: Colors.blue),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing: 10.0,
          children: [
            TextField(
              controller: usernameTextEditController,
              decoration: InputDecoration(
                labelText: "username",
                icon: Icon(Icons.people),
                hintText: "Enter username",
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.red[100],
              ),
              onChanged: (val) => {print("onchange ========> $val")},
              onSubmitted: (val) => print("onSubmitted ========> $val"),
            ),
            TextField(
              controller: passwordTextEditController,
              decoration: InputDecoration(
                labelText: "password",
                icon: Icon(Icons.lock),
                hintText: "Enter password",
                filled: true,
                fillColor: Colors.blueAccent[100],
                border: OutlineInputBorder(),
              ),
              onChanged: (val) => print("onchange ======> $val"),
              onSubmitted: (val) => print("onSubmitted ======> $val"),
            ),
            SizedBox(
              width: double.infinity,
              height: 32.0,
              child: TextButton(
                onPressed: () {
                  // 获取当前的表单信息
                  final username = usernameTextEditController.text;
                  final password = passwordTextEditController.text;
                  print("username: $username, password: $password");
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
                child: Text("Submit", style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
