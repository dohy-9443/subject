import 'package:flutter/material.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : round_square.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 19..
/// Description      : 
///

class RoundSquare extends StatelessWidget {
  final Color backgroundColor;
  final EdgeInsetsGeometry? margin;
  final Widget child;

  const RoundSquare({super.key, required this.backgroundColor, required this.child, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppInset.all8,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
