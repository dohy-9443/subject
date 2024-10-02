import 'package:flutter/material.dart';

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
    this.backgroundColor,
    required this.onPressed,
    required this.child
  });

  factory MSButton.basic({
    required VoidCallback onPressed,
    required Widget child,
    required double width,
    required double height,
    required Color backgroundColor,
    BorderRadiusGeometry? borderRadius,
  }) {
    return MSButton(
      onPressed: onPressed,
      child: child,
      width: width,
      height: height,
      borderRadius: borderRadius,
      backgroundColor: backgroundColor,
    );
  }

  factory MSButton.gradient({
    required VoidCallback onPressed,
    required double width,
    required double height,
    required Widget child,
    required Gradient gradient,
    BorderRadiusGeometry? borderRadius,
  }) {
    return MSButton(
      onPressed: onPressed,
      isGradient: true,
      width: width,
      height: height,
      borderRadius: borderRadius,
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
      color: isGradient ? null : backgroundColor,
      decoration: isGradient ? BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ) : null,
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
