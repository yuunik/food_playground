import 'package:flutter/material.dart';

/// 动画的无限播放, 当按下按键时, 停止播放
/// 可原本缩小的的动画, 停止播放后, 再开始播放,
/// 哪怕缩小动画没播完, 也开始执行放大动画了
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const AppHomePage());
  }
}

class AppHomePage extends StatefulWidget {
  const AppHomePage({super.key});

  @override
  State<AppHomePage> createState() => _AppHomePageState();
}

class _AppHomePageState extends State<AppHomePage>
    with SingleTickerProviderStateMixin {
  ///  1. Animation: 抽象类
  ///    * 监听动画值的改变
  ///    * 监听动画状态的改变
  ///    * value
  ///    * status
  ///
  ///  2. AnimationController 继承自 Animation
  ///    * vsync: 同步信号 (this -> with SingleTickerProviderStateMixin)
  ///    * forward(): 向前执行动画
  ///    * reverse(): 反转执行动画
  ///
  ///  3. CurvedAnimation:
  ///    * 作用: 设置动画执行的速率 (速度曲线)
  ///
  ///  4. Tween: 设置动画执行的 value 范围
  ///    * begin: 开始值
  ///    * end: 结束值

  // 创建 AnimationController
  late final AnimationController _animationController;

  // 创建 CurvedAnimation
  late final CurvedAnimation _curvedAnimation;

  // 创建 Animation
  late final Animation _tweenAnimation;

  @override
  void initState() {
    super.initState();
    // 1. 实例化 _animationController
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
      // 效果动画要求最小值必须为 0, 可以不写, 因为默认值就是0
      // lowerBound: 50,
      // 效果动画要求最大值必须为 1, 可以不写, 因为默认值就是1
      // upperBound: 150,
    );

    // 2. 实例化效果动画 _curvedAnimation
    _curvedAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInCubic,
    );

    // 3. 实例化值范围动画 _tweenAnimation
    _tweenAnimation = Tween(begin: 50.0, end: 150.0).animate(_curvedAnimation);

    // 4. 监听 _animationController 动画值的变化
    _animationController.addListener(() {
      setState(() {});
    });

    // 5. 监听 _animationController 动画的状态变化
    _animationController.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        // 动画结束, 则反转执行动画
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // 动画结束在开头位置, 则向前执行动画
        _animationController.forward();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 动画效果
    // final controller = AnimationController(vsync: this);
    // 为该动画效果设置执行的速率
    // final animation = CurvedAnimation(parent: controller, curve: Curves.linear);
    // 为该动画设置 value 的范围
    // 传入 animation 或 controller都行, 如果只传入 controller, 则说明不需要动画上的执行速率
    // final valueAnimation = Tween(begin: 100, end: 200).animate(animation);

    return Scaffold(
      appBar: AppBar(title: Text("Animation Demo"), centerTitle: true),
      body: Center(
        child: Icon(
          Icons.favorite,
          size: _tweenAnimation.value,
          color: Colors.redAccent,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _animationController.forward();
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
