import 'package:flutter/material.dart';
import 'package:maple_story_book/app/presentation/search/search_screen.dart';
import 'package:maple_story_book/tool/theme/theme.dart';

///
/// @Project name    : maple_story_book
/// @Class           : maple_story_book_app.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 18..
/// Description      :
///

class MapleStoryBookApp extends StatelessWidget {
  const MapleStoryBookApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '메이플 스토리 북',
      theme: ThemeData(fontFamily: FontFamily.taengGu),
      home: Scaffold(
        body: SearchScreen()
      ),
    );
  }
}
