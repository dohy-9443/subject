import 'package:flutter/material.dart';
import 'package:maple_story_book/core/util/insets.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/theme/colors.dart';
import 'package:maple_story_book/tool/theme/theme.dart';

///
/// @Project name    : maple_story_book
/// @Class           : maple_story_alert.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 2..
/// Description      : 
///

class MSAlert extends StatelessWidget {
  final String title;
  final String content;

  const MSAlert({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppInset.all4,
      constraints: const BoxConstraints(
        maxWidth: double.infinity * 0.9,
        maxHeight: 250,
      ),
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        color: ColorName.modal.withOpacity(0.8),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          width: 4,
          color: ColorName.lightGray2,
        )
      ),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Color(0xFFEEEEEE),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          Container(
            width: 200,
            height: 192,
            margin: AppInset.edgeInsetsValue([3]),
            decoration: BoxDecoration(
              color: ColorName.white,
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          Positioned(
            right: 0,
            top: 50,
            child: Column(
              children: [
                Image.asset(
                  Assets.images.pinkAlert.path,
                  width: 150,
                ),
                AppSize.height(10),

              ],
            ),
          )
        ],
      ),
    );
  }
}

// #268EC9
Future<void> mSAlert(BuildContext context, {required String title, required String content,}) async {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return Dialog(child: MSAlert(title: title, content: content,),);
    }
  );
}

