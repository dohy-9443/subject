import 'package:flutter/material.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_error_widget.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 7..
/// Description      : 
///

class HomeErrorWidget extends StatelessWidget {
  final dynamic error;
  final StackTrace? stackTrace;

  const HomeErrorWidget({super.key, required this.error, this.stackTrace,});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MSText.danger("Error: $error"),
    );
  }
}
