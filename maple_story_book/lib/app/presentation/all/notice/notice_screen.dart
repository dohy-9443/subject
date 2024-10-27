import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

///
/// @Project name    : maple_story_book
/// @Class           : notice_screen.
/// @Created by      : shinheetae.
/// Created On       : 2024. 10. 2..
/// Description      :
///

@RoutePage()
class NoticeScreen extends StatelessWidget {
  const NoticeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('notice'),),
    );
  }
}
