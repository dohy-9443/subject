import 'package:flutter/material.dart';
import 'package:maple_story_book/tool/component/component.dart';
import 'package:maple_story_book/tool/theme/theme.dart';

///
/// @Project name    : maple_story_book
/// @Class           : search_contents.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 30..
/// Description      : 
///

class SearchContents extends StatelessWidget {
  const SearchContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MSText.taengGu(
            '캐릭터의 닉네임을\n 입력해주세요.',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.center,
          ),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.images.orange.path),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

