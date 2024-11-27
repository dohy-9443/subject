import 'package:flutter/material.dart';

///
/// @Project name    : maple_story_book
/// @Class           : avoid_duplicate_touch.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 11. 27..
/// Description      : 
///

class AvoidDuplicateTouch extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  final double? width;
  final double height;
  final Color color;
  const AvoidDuplicateTouch({
    super.key,
    required this.child,
    required this.onTap,
    this.width,
    this.height = 40,
    required this.color,
  });

  @override
  State<AvoidDuplicateTouch> createState() => _AvoidDuplicateTouchState();
}

class _AvoidDuplicateTouchState extends State<AvoidDuplicateTouch> {
  @override
  Widget build(BuildContext context) {
    int prev = -1;
    return Container(
      width: widget.width,
      height: widget.height,
      color: widget.color,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            final now = DateTime.now();
            final nowTime = now.millisecondsSinceEpoch;
            if (prev == -1 || (nowTime > prev + 300)) {
              widget.onTap();
            }
          },
          child: widget.child,
        ),
      ),
    );
  }
}
