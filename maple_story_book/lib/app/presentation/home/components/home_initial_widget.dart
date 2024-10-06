import 'package:flutter/material.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_initial_widget.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 7..
/// Description      : 
///

class HomeInitialWidget extends StatelessWidget {
  const HomeInitialWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MSText.bold('로딩중...'),
    );
  }
}
