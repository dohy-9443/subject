import 'package:flutter/material.dart';

///
/// @Project name    : maple_story_book
/// @Class           : insets.dart.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 23..
/// Description      :
///

abstract class AppInset {
  AppInset._();

  static const top2 = EdgeInsets.only(top: 2);
  static const top4 = EdgeInsets.only(top: 4);
  static const top6 = EdgeInsets.only(top: 6);
  static const top8 = EdgeInsets.only(top: 8);
  static const top10 = EdgeInsets.only(top: 10);

  static const bottom2 = EdgeInsets.only(bottom: 2);
  static const bottom4 = EdgeInsets.only(bottom: 4);
  static const bottom6 = EdgeInsets.only(bottom: 6);
  static const bottom8 = EdgeInsets.only(bottom: 8);
  static const bottom10 = EdgeInsets.only(bottom: 10);

  static const left2 = EdgeInsets.only(left: 2);
  static const left4 = EdgeInsets.only(left: 4);
  static const left6 = EdgeInsets.only(left: 6);
  static const left8 = EdgeInsets.only(left: 8);
  static const left10 = EdgeInsets.only(left: 10);

  static const right2 = EdgeInsets.only(right: 2);
  static const right4 = EdgeInsets.only(right: 4);
  static const right6 = EdgeInsets.only(right: 6);
  static const right8 = EdgeInsets.only(right: 8);
  static const right10 = EdgeInsets.only(right: 10);

  static const v2 = EdgeInsets.symmetric(vertical: 2);
  static const v4 = EdgeInsets.symmetric(vertical: 4);
  static const v6 = EdgeInsets.symmetric(vertical: 6);
  static const v8 = EdgeInsets.symmetric(vertical: 8);
  static const v10 = EdgeInsets.symmetric(vertical: 10);

  static const h2 = EdgeInsets.symmetric(horizontal: 2);
  static const h4 = EdgeInsets.symmetric(horizontal: 4);
  static const h6 = EdgeInsets.symmetric(horizontal: 6);
  static const h8 = EdgeInsets.symmetric(horizontal: 8);
  static const h10 = EdgeInsets.symmetric(horizontal: 10);

  static const all2 = EdgeInsets.all(2);
  static const all4 = EdgeInsets.all(4);
  static const all6 = EdgeInsets.all(6);
  static const all8 = EdgeInsets.all(8);
  static const all10 = EdgeInsets.all(10);

  static EdgeInsets edgeInsetsValue(List<double> values) {
    if (values.isEmpty || values.length > 4) throw ArgumentError('1, 2, 4 개의 값만 적어야 합니다.');

    switch (values.length) {
      case 1: return EdgeInsets.all(values[0]);
      case 2: return EdgeInsets.symmetric(horizontal: values[1], vertical: values[0]);
      case 4: return EdgeInsets.fromLTRB(values[3], values[0], values[1], values[2]);
      default: throw ArgumentError('1, 2, 4 개의 값을 넣어야 합니다.');
    }
  }
}
