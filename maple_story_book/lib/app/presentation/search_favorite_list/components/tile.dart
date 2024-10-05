import 'dart:math';

import 'package:flutter/material.dart';
import 'package:maple_story_book/tool/theme/theme.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

///
/// @Project name    : maple_story_book
/// @Class           : tile.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 5..
/// Description      : 
///

class Tile extends StatelessWidget {
  const Tile({
    Key? key,
    required this.index,
    this.height,
    this.width,
    this.onTap,
  }) : super(key: key);

  final double? height;
  final double? width;
  final int index;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {

    Color color = Colors.primaries[Random().nextInt(Colors.primaries.length)];

    return Container(
      color: color,
      width: width,
      height: height,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () { print("동작? $index"); },
          child: Center(
            child: MSText.bold(index.toString(), fontSize: 20, color: ColorName.white,),
          ),
        ),
      ),
    );
  }
}
