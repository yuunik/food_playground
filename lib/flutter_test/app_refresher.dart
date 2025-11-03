import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_playground/flutter_learner/_12_animation_P16/pages/image_preview.dart';
import 'package:food_playground/flutter_learner/_12_animation_P16/pages/modal_page.dart';

/// 下拉刷新功能已实现
/// 上拉加载更多尚未做
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
  final ScrollController _controller = ScrollController();

  /// 当前的偏移量
  double _offset = 0.0;

  late AnimationController _animationController;

  late CurvedAnimation _curvedAnimation;

  /// 下拉刷新标记
  late bool _isRefreshing = false;

  /// 上拉加载更多标记
  late bool _isLoadMore = false;

  /// 可滚动的总高度
  late double _scrollExtent;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeOutBack)
          ..addListener(() {
            setState(() {
              // 让 _offset 从原始值平滑过渡到 0
              _offset = _curvedAnimation.value * _offset;
            });
          });
  }

  /// 回弹动画
  void _startRebound() {
    HapticFeedback.lightImpact();
    _animationController.reverse(from: 1);
    // 回弹结束, 重置标记
    _isRefreshing = false;
    _isLoadMore = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hero animation demo"), centerTitle: true),
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.grey[200],
            ),
          ),
          NotificationListener(
            onNotification: (ScrollNotification notification) {
              if (notification is OverscrollNotification) {
                print("越界滚动距离: ${notification.overscroll}");
                if (notification.overscroll < 0 &&
                    notification.metrics.extentBefore == 0) {
                  // 用户在顶部向下拖动（下拉）
                  print("检测到下拉动作！overscroll: ${notification.overscroll}");
                  // 你可以在这里触发自定义逻辑
                  setState(() {
                    _isRefreshing = true;

                    /// 缩小拉动幅度, 让效果更柔和
                    _offset -= notification.overscroll / 2;
                  });
                } else if (notification.overscroll > 0 &&
                    notification.metrics.extentAfter == 0) {
                  print("上拉加载更多...");
                  setState(() {
                    _isLoadMore = true;
                    _offset -= notification.overscroll / 2;
                  });
                }
              } // ✅ 关键逻辑：检测“用户回推”行为
              else if (notification is ScrollUpdateNotification) {
                _scrollExtent = notification.metrics.maxScrollExtent;
                if (_offset > 0 && notification.scrollDelta != null) {
                  /// notification.scrollDelta 为用户上推的距离
                  final delta = notification.scrollDelta!;
                  if (delta > 0) {
                    // 用户正在往上推，减小 offset
                    setState(() {
                      /// clamp(0.0, double.infinity) 用来防止 _offset 变成负数。
                      _offset = (_offset - delta).clamp(0.0, double.infinity);
                    });
                  }
                }
              } else if (notification is ScrollEndNotification) {
                /// 用户松开手后, 开始回弹
                _startRebound();
                print("用户松手了~~~~");
              }
              return true;
            },
            child: AnimatedBuilder(
              animation: _curvedAnimation,
              builder: (BuildContext context, Widget? child) =>
                  Transform.translate(
                    offset: Offset(0, _offset),
                    child: GridView(
                      physics: const ClampingScrollPhysics(),
                      // controller: _controller,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: .8,
                      ),
                      children: List.generate(20, (index) => child as Widget),
                    ),
                  ),
              child: Container(color: Color.fromARGB(255, 144, 244, 44)),
            ),
          ),
          if (_isRefreshing)
            Container(
              height: _offset,
              alignment: Alignment.center,
              child: _offset > 50.0
                  ? const RefreshProgressIndicator()
                  : const Icon(Icons.arrow_downward),
            ),
          if (_isLoadMore)
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Container(
                height: _scrollExtent - _offset, // ✅ 固定高度
                alignment: Alignment.center,
                child: const Text("Loading..."),
              ),
            ),
        ],
      ),
    );
  }
}
