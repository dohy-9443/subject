import 'package:flutter/material.dart';
import 'package:maple_story_book/tool/theme/theme.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

///
/// @Project name    : maple_story_book
/// @Class           : maple_story_loading.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 9..
/// Description      : 
///

class MSLoading extends StatelessWidget {
  const MSLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.images.orange.path),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            MSText.bold('로딩중...', color: ColorName.darkGray2,),
          ],
        ),
      ),
    );
  }
}
