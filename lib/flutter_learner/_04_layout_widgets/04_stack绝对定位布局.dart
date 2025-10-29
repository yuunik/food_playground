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
  @override
  Widget build(BuildContext context) {
    return StackDemo2();
  }
}

class StackDemo2 extends StatefulWidget {
  const StackDemo2({super.key});

  @override
  State<StackDemo2> createState() => _StackDemo2State();
}

class _StackDemo2State extends State<StackDemo2> {
  bool _isFavor = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/welcome.png"),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            color: Color.fromRGBO(0, 0, 0, 0.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hello, yuunik~",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                IconButton(
                  onPressed: () => setState(() {
                    _isFavor = !_isFavor;
                  }),
                  icon: Icon(
                    Icons.login,
                    color: _isFavor ? Colors.redAccent : Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class StackDemo extends StatelessWidget {
  const StackDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      /**
       * Stack 默认的大小是包裹内容的
       *  - alignment: 表示从什么位置排布所有的子 Widget
       *  - fit: expand 将子元素拉伸至尽可能的大
       *  - overflow: 表示超出的部分该如何处理
       *
       * Positioned
       *
       */
      alignment: AlignmentDirectional.bottomEnd,
      // fit: StackFit.expand,
      // clipBehavior: Clip.none,
      children: [
        Image.asset("assets/images/welcome.png", width: 300, fit: BoxFit.cover),
        Positioned(
          left: 20,
          bottom: -50,
          child: Container(width: 150, height: 150, color: Colors.redAccent),
        ),
        Positioned(
          right: 0,
          bottom: 20,
          child: Text(
            "Welcome!",
            style: TextStyle(fontSize: 30, color: Colors.redAccent),
          ),
        ),
      ],
    );
  }
}

class ExpandedDemo extends StatelessWidget {
  const ExpandedDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.alphabetic,
      children: [
        /**
         * Flexible 中的属性:
         *  - flex
         *
         *  Expanded => Flexible(fit: FlexFit.tight)
         *
         *  flex: 1的Expanded 为 flex: 2 的 Expanded的宽度的 1 / 2
         */
        Expanded(
          child: Container(width: 150, height: 60, color: Colors.redAccent),
        ),
        Expanded(
          flex: 2,
          child: Container(width: 2000, height: 100, color: Colors.greenAccent),
        ),
        Container(width: 90, height: 80, color: Colors.blueAccent),
        Container(width: 50, height: 120, color: Colors.orangeAccent),
      ],
    );
  }
}

class FlexibleDemo extends StatelessWidget {
  const FlexibleDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      textBaseline: TextBaseline.alphabetic,
      children: [
        /**
         * Flexible 中的属性:
         *  - flex
         */
        Flexible(
          fit: FlexFit.tight,
          flex: 1,
          child: Container(width: 80, height: 60, color: Colors.redAccent),
        ),
        Flexible(
          fit: FlexFit.tight,
          flex: 2,
          child: Container(width: 120, height: 100, color: Colors.greenAccent),
        ),
        Container(width: 90, height: 80, color: Colors.blueAccent),
        Container(width: 50, height: 120, color: Colors.orangeAccent),
      ],
    );
  }
}

class ColumnDemo extends StatelessWidget {
  const ColumnDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      textBaseline: TextBaseline.ideographic,
      verticalDirection: VerticalDirection.down,
      children: [
        Container(
          width: 80,
          height: 60,
          color: Colors.redAccent,
          child: Text("Hello", style: TextStyle(fontSize: 30)),
        ),
        Container(
          width: 120,
          height: 100,
          color: Colors.greenAccent,
          child: Text("Hello", style: TextStyle(fontSize: 12)),
        ),
        Container(
          width: 90,
          height: 80,
          color: Colors.blueAccent,
          child: Text("Hello", style: TextStyle(fontSize: 6)),
        ),
        Container(
          width: 50,
          height: 120,
          color: Colors.orangeAccent,
          child: Text("Hello", style: TextStyle(fontSize: 7)),
        ),
      ],
    );
  }
}

class RowDemo extends StatelessWidget {
  const RowDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Container(
            width: 80,
            height: 60,
            color: Colors.redAccent,
            child: Text("Hello", style: TextStyle(fontSize: 30)),
          ),
          Container(
            width: 120,
            height: 100,
            color: Colors.greenAccent,
            child: Text("Hello", style: TextStyle(fontSize: 12)),
          ),
          Container(
            width: 90,
            height: 80,
            color: Colors.blueAccent,
            child: Text("Hello", style: TextStyle(fontSize: 6)),
          ),
          Container(
            width: 50,
            height: 120,
            color: Colors.orangeAccent,
            child: Text("Hello", style: TextStyle(fontSize: 7)),
          ),
        ],
      ),
    );
  }
}

class ButtonRowDemo extends StatelessWidget {
  const ButtonRowDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // Row / Column : 继承自 Flex
    // Flex: CSS Flex 布局
    // Axis.vertical === Column
    // Axis.horizontal === Row

    /**
     * Row 特点:
     *  - 水平方向尽可能地占据比较大的空间
     *    * 水平方向也是希望包裹内容, 那么设置 mainAxisSize = min
     *
     * MainAxisAlignment:
     *  - start: 主轴的开始位置挨个摆放元素
     *  - end: 主轴的结束位置挨个拜访元素
     *  - spaceBetween: 左右两边的间距为 0, 其他元素之间平分间距
     *  - spaceAround: 左右的两边的间距为其他元素之间的间距的一半
     *  - spaceEvenly: 所有的间距平分空间
     */
    return ElevatedButton(
      onPressed: () => print('button click'),
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.redAccent,
      ),
      child: Row(
        spacing: 4,
        mainAxisSize: MainAxisSize.min,
        children: [Icon(Icons.bug_report), Text("Bug Report")],
      ),
    );
  }
}
