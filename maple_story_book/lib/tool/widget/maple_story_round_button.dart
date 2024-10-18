import 'package:flutter/material.dart';
import 'package:maple_story_book/core/util/insets.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/theme/theme.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

///
/// @Project name    : maple_story_book
/// @Class           : maple_story_round_button.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 18..
/// Description      : 
///

enum IconPosition {
  left, top, right, bottom;
}

class MSRoundButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final IconData? icon;
  final IconPosition iconPosition;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color fontColor;
  final double fontSize;
  final Color? iconColor;
  final double iconSize;
  final double iconRotation;

  const MSRoundButton({
    super.key,
    this.width,
    this.height,
    required this.text,
    this.fontColor = ColorName.lightText,
    this.fontSize = 16,
    this.icon,
    this.iconColor,
    this.iconSize = 30,
    this.iconPosition = IconPosition.left,
    this.backgroundColor = Colors.transparent,
    required this.onPressed,
    this.iconRotation = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: AppInset.edgeInsetsValue([12, 12]),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(50),
          child: iconPosition == IconPosition.left || iconPosition == IconPosition.right
              ? Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: _horizontalContent()
          ) : Column(
            mainAxisSize: MainAxisSize.min,
            children: _verticalContent()
          ),
        ),
      ),
    );
  }

  List<Widget> _horizontalContent() {
    List<Widget> content = [];

    // 왼쪽에 아이콘
    if (icon != null && iconPosition == IconPosition.left) {
      content.add(_buildRotatedIcon());
      content.add(AppSize.width(4));
    }

    // 텍스트 추가
    content.add(MSText.bold(text, color: fontColor, fontSize: fontSize,));

    // 오른쪽 아이콘
    if (icon != null && iconPosition == IconPosition.right) {
      content.add(AppSize.width(4)); // 텍스트와 아이콘 사이의 간격
      content.add(_buildRotatedIcon());
    }

    return content;
  }

  List<Widget> _verticalContent() {
    List<Widget> content = [];

    // 위  아이콘
    if (icon != null && iconPosition == IconPosition.top) {
      content.add(_buildRotatedIcon());
      content.add(const SizedBox(height: 4)); // 아이콘과 텍스트 사이의 간격
    }

    content.add(MSText.bold(text, color: fontColor, fontSize: fontSize,));

    if (icon != null && iconPosition == IconPosition.bottom) {
      content.add(const SizedBox(height: 4)); // 텍스트와 아이콘 사이의 간격
      content.add(_buildRotatedIcon());
    }

    return content;
  }

  Widget _buildRotatedIcon() {
    return Transform.rotate(
      angle: iconRotation,
      child: Icon(icon, color: iconColor, size: iconSize,),
    );
  }
}
