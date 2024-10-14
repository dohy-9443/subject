import 'package:flutter/material.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_state.dart';
import 'package:maple_story_book/app/presentation/home/components/components.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_success_widget.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 7..
/// Description      : 
///

class HomeFragment extends StatelessWidget {
  final HomeSuccess state;

  const HomeFragment({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    BasicInfo basicInfo = state.basicInfo;
    Stat stat = state.stat;

    return MSBaseBuildWidget(
      title: basicInfo.characterName,
      body: Container(
        child: SingleChildScrollView(
          child: Padding(
            padding: AppInset.all8,
            child: Column(
              children: [
                HomeTop(basicInfo: basicInfo,),
                AppSize.height(8),
                HomeCenter(stat: stat),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
