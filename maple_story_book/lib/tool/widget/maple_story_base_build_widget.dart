import 'package:flutter/material.dart';

///
/// @Project name    : maple_story_book
/// @Class           : maple_story_base_build_widget.
/// @Created by      : shinheetae.
/// Created On       : 2024. 10. 10..
/// Description      :
///

class MSBaseBuildWidget extends StatelessWidget {
  final Widget appBar;
  final Widget body;

  const MSBaseBuildWidget({
    super.key,
    required this.appBar,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appBar,
        Expanded(
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: body,
          ),
        ),
      ],
    );
  }
}
