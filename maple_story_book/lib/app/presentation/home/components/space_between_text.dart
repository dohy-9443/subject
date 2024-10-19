import 'package:flutter/material.dart';
import 'package:maple_story_book/tool/theme/theme.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

///
/// @Project name    : maple_story_book
/// @Class           : space_between_text.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 19..
/// Description      : 
///

enum SizeType {
  bold, basic;
}

class SpaceBetweenText extends StatelessWidget {
  final String title;
  final double? titleSize;
  final SizeType titleType;
  final String content;
  final double? contentSize;
  final SizeType contentType;

  const SpaceBetweenText({
    super.key,
    required this.title,
    this.titleSize,
    this.titleType = SizeType.bold,
    required this.content,
    this.contentSize,
    this.contentType = SizeType.basic,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        titleType == SizeType.bold ?
          MSText.bold(title, color: ColorName.white, fontSize: titleSize ?? 16,) :
          MSText.basic(title, color: ColorName.white, fontSize: titleSize ?? 16,),
        contentType == SizeType.bold ?
          MSText.bold(content, color: Colors.white, fontSize: contentSize ?? 16,) :
          MSText.basic(content, color: Colors.white, fontSize: contentSize ?? 16,)
      ],
    );
  }
}
