import 'package:flutter/cupertino.dart';

///
/// @Project name    : maple_story_book
/// @Class           : sizes.dart.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 23..
/// Description      :
///

abstract class AppSize {
  AppSize._();

  static const size2 = SizedBox(width: 2,height: 2);
  static const size4 = SizedBox(width: 4,height: 4);
  static const size6 = SizedBox(width: 6,height: 6);
  static const size8 = SizedBox(width: 8,height: 8);
  static const size10 = SizedBox(width: 10,height: 10);
  static const size20 = SizedBox(width: 20,height: 20);
  static const size30 = SizedBox(width: 30,height: 30);

  static SizedBox width(double value) => SizedBox(width: value);
  static SizedBox height(double value) => SizedBox(height: value);
  static SizedBox shrink() => const SizedBox.shrink();
}
