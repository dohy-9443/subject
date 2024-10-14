import 'package:flutter/material.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

///
/// @Project name    : maple_story_book
/// @Class           : maple_story_base_build_widget.
/// @Created by      : shinheetae.
/// Created On       : 2024. 10. 10..
/// Description      :
///

class MSBaseBuildWidget extends StatelessWidget {
  final Widget? appBar;
  final String? title;
  final Widget body;

  const MSBaseBuildWidget({
    super.key,
    this.appBar,
    this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appBar ?? MSAppBar(
          title: title ?? "",
          isBoxShadow: false,
          leading: IconButton(
              onPressed: () {
                /// TODO : 즐겨찾기 리스트 페이지로 이동, 즐겨찾기를 해놓지 않았다면 alert 또는 toast 메시지
              },
              icon: const Icon(Icons.menu)
          ),
          actions: [
            IconButton(
                onPressed: () {
                  /// TODO : 검색 페이지로 이동
                },
                icon: const Icon(Icons.search)
            )
          ],
        ),
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
