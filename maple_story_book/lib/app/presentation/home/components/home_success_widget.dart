import 'package:flutter/material.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_state.dart';
import 'package:maple_story_book/core/extension/null_check_extension.dart';
import 'package:maple_story_book/tool/theme/colors.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_success_widget.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 7..
/// Description      : 
///

class HomeSuccessWidget extends StatelessWidget {
  final HomeSuccess state;

  const HomeSuccessWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    var basicInfo;

    if (state.basicInfo.hasData) {
      basicInfo = state.basicInfo;
    } else {
      basicInfo = BasicInfo();
    }

    final (
      date,
      characterName,
      worldName,
      characterGender,
      characterClass,
      characterClassLevel,
      characterLevel,
      characterExp,
      characterExpRate,
      characterGuildName,
      characterImage,
      characterDateCreate,
      accessFlag,
      liberationQuestClearFlag,
    ) = BasicInfo.getCharacterInfo(basicInfo);

    return MSBaseBuildWidget(
      title: characterName,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(color: ColorName.danger, width: double.infinity, height: 20,)
          ],
        ),
      ),
    );
  }
}
