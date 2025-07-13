import 'package:food_playground/ui/shared/screen_fit.dart';
/// double 单位适配扩展
extension DoubleExtension on double {
  // px 适配
  double get px => this * ScreenFit.px;

  // rpx 适配
  double get rpx => this * ScreenFit.rpx;
}