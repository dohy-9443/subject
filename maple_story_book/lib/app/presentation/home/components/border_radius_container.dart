import 'package:flutter/material.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/theme/theme.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

///
/// @Project name    : maple_story_book
/// @Class           : border_radius_container.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 14..
/// Description      : 
///

class BorderRadiusContainer extends StatelessWidget {

  final List<String> text;
  final Color fontColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry padding;
  final bool bold;

  const BorderRadiusContainer(
    this.text, {
      super.key,
      this.fontColor = ColorName.white,
      this.backgroundColor = ColorName.lightGray2,
      this.padding = AppInset.all2,
      this.bold = false,
    }
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: text.length == 1 ?
        bold ?
          MSText.bold(text.first, textAlign: TextAlign.center, color: fontColor, fontSize: 12,) :
          MSText.basic(text.first, textAlign: TextAlign.center, color: fontColor, fontSize: 12,) :
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              AppSize.width(4),
              MSText.basic(text.first, color: fontColor, fontSize: 12,),
            ],
          ),
          Row(
            children: [
              MSText.basic(text.last, color: fontColor, fontSize: 12,),
              AppSize.width(4),
            ],
          ),
        ],
      ),
    );
  }
}
