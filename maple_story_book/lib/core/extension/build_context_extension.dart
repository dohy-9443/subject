import 'package:flutter/material.dart';

///
/// @Project name    : maple_story_book
/// @Class           : build_context_extension.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 6..
/// Description      : 
///

extension BuildContextExtensions on BuildContext {
  // 화면의 너비
  double get screenWidth => MediaQuery.of(this).size.width;

  // 화면의 높이
  double get screenHeight => MediaQuery.of(this).size.height;
}