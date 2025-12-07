import 'dart:async';

import 'package:flutter/material.dart';

import 'package:food_playground/flutter_test/app_rpm_bar.dart';

class ProfileContentPage extends StatefulWidget {
  const ProfileContentPage({super.key});

  @override
  State<ProfileContentPage> createState() => _ProfileContentPageState();
}

class _ProfileContentPageState extends State<ProfileContentPage> {
  double _width = 50.0;

  // 定时器
  Timer? _periodicTimer;

  // 控制增减方向的标志位，true为增加，false为减少
  bool _increasing = true;

  // 开启定时器
  void startPeriodicTimer() {
    // 如果定时器已经在运行，先取消
    _periodicTimer?.cancel();

    // 设置一个较短的间隔，以便看到平滑的动画效果
    _periodicTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      // 每次更新的步长
      const double step = 2.0;

      setState(() {
        if (_increasing) {
          // --- 增加阶段 ---

          _width += step;

          // 达到上限后，切换为减少方向
          if (_width >= 250.0) {
            _width = 250.0; // 确保不超过上限
            _increasing = false;
          }
        } else {
          // --- 减少阶段 ---

          _width -= step;

          // 达到下限 50 后，停止定时器
          if (_width <= 50.0) {
            _width = 50.0; // 确保达到下限
            _increasing = true; // 重置方向，以便下次点击重新开始增加
          }
        }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _periodicTimer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20.0,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: AppRpmBar(width: _width),
            ),
          ),
          Text("当前车速为: $_width km/h", style: TextStyle(fontSize: 20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 8,
            children: [
              ElevatedButton(
                onPressed: () => startPeriodicTimer(),
                child: Text("开车"),
              ),
              ElevatedButton(
                onPressed: () => _periodicTimer?.cancel(),
                child: Text("停车"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
