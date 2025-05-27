import 'package:food_playground/ui/shared/size_fit.dart';

extension StringFit on String {
  // px 适配
  double get px => double.parse(this) * SizeFit.px;

  // rpx 适配
  double get rpx => double.parse(this) * SizeFit.rpx;
}