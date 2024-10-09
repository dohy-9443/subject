import 'package:flutter/material.dart';
import 'package:maple_story_book/tool/theme/theme.dart';
import 'package:maple_story_book/tool/widget/maple_story_text.dart';

class MSAppBar extends StatelessWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final Widget? bottom;
  final Color backgroundColor;
  final Color bottomBackgroundColor;

  const MSAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
    this.bottom,
    this.backgroundColor = ColorName.mainAccent,
    this.bottomBackgroundColor = ColorName.lightGray2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: kToolbarHeight,
              child: Stack(
                children: [
                  Center(
                    child: MSText.bold(
                      title,
                      color: ColorName.white,
                      fontSize: 20,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    bottom: 0,
                    child: SizedBox(
                        width: 48,
                        height: kToolbarHeight,
                        child: leading ?? const SizedBox.shrink()),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    bottom: 0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: actions ?? [],
                    ),
                  ),
                ],
              ),
            ),
            if (bottom != null) bottom!,
          ],
        ),
      ),
    );
  }
}
