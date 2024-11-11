import 'package:flutter/material.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/theme/theme.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

///
/// @Project name    : maple_story_book
/// @Class           : maple_story_full_screen.
/// @Created by      : shinheetae.
/// Created On       : 2024. 10. 9..
/// Description      :
///

class MSErrorFullScreen extends StatelessWidget {
  final String? error;
  final VoidCallback onPressed;

  const MSErrorFullScreen({super.key, this.error, required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.images.yetti.path),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            MSText.danger(error == null ? '에러가 발생했습니다.' : error!),
            AppSize.height(20),
            MSButton.gradient(
              onPressed: onPressed,
              width: 100,
              height: 40,
              border: Border.all(
                width: 2,
                color: ColorName.darkGreen,
              ),
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                colors: [
                  ColorName.lightGreen,
                  ColorName.darkGreen,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              child: MSText.bold(
                '문의',
                color: ColorName.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
