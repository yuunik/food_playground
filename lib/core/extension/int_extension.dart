import 'package:food_playground/ui/shared/screen_fit.dart';

/// int 单位适配扩展
extension IntExtension on int {
  // px 适配
  double get px => toDouble() * ScreenFit.px;

  // rpx 适配
  double get rpx => toDouble() * ScreenFit.rpx;
}
