import 'package:flutter/material.dart';
import 'package:maple_story_book/tool/theme/colors.dart';

///
/// @Project name    : maple_story_book
/// @Class           : maple_stroy_button.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 2..
/// Description      : 
///

class MSButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final bool isGradient;
  final Gradient? gradient;
  final BoxBorder? border;
  final Color? backgroundColor;
  final VoidCallback onPressed;
  final Widget child;

  const MSButton({
    super.key,
    this.borderRadius,
    this.width,
    this.height = 40,
    this.isGradient = false,
    this.gradient,
    this.border,
    this.backgroundColor,
    required this.onPressed,
    required this.child
  });

  factory MSButton.basic({
    required VoidCallback onPressed,
    required Widget child,
    double? width,
    required double height,
    required Color backgroundColor,
    BorderRadiusGeometry? borderRadius,
    BoxBorder? border,
  }) {
    return MSButton(
      onPressed: onPressed,
      child: child,
      width: width,
      height: height,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
      border: border,
    );
  }

  factory MSButton.gradient({
    required VoidCallback onPressed,
    required double width,
    required double height,
    required Widget child,
    required Gradient gradient,
    BoxBorder? border,
    BorderRadiusGeometry? borderRadius,
  }) {
    return MSButton(
      onPressed: onPressed,
      isGradient: true,
      width: width,
      height: height,
      borderRadius: borderRadius,
      border: border,
      gradient: gradient,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {

    final borderRadius = this.borderRadius ?? BorderRadius.circular(0);

    return Container(
      width: width,
      height: height,

      decoration: isGradient ? BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
        border: border,
      ) : BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border: border,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          maximumSize: Size(width!, height),
          minimumSize: Size(width!, height),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: child,
      ),
    );
  }
}
