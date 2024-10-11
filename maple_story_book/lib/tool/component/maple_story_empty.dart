import 'package:flutter/material.dart';
import 'package:maple_story_book/tool/theme/theme.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

///
/// @Project name    : maple_story_book
/// @Class           : maple_story_empty.
/// @Created by      : shinheetae.
/// Created On       : 2024. 10. 7..
/// Description      :
///

class MSEmpty extends StatelessWidget {
  final String? description;
  MSEmpty({super.key, this.description});

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
                  image: AssetImage(Assets.images.zaqqum.path),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            MSText.bold(description ?? '리스트가 비어있습니다.', color: ColorName.darkGray2,),
          ],
        ),
      ),
    );
  }
}

