import 'package:flutter/material.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_state.dart';
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
    final BasicInfo basicInfo = state.basicInfo!;

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

    return Center(
      child: MSText.basic(
        """
        characterName : $characterName,
        worldName : $worldName,
        characterGender : $characterGender,
        characterClass : $characterClass,
        characterClassLevel : $characterClassLevel,
        characterLevel : $characterLevel,
        characterExp : $characterExp,
        characterExpRate : $characterExpRate,
        characterGuildName : $characterGuildName,
        characterImage : $characterImage,
        characterDateCreate : $characterDateCreate,
        accessFlag : $accessFlag,
        liberationQuestClearFlag : $liberationQuestClearFlag
        """,
      ),
    );
  }
}
