import 'package:flutter/material.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_state.dart';
import 'package:maple_story_book/tool/component/component.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_success_widget.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 7..
/// Description      : 
///

class HomeSuccessWidget extends StatelessWidget {
  final HomeData data;

  const HomeSuccessWidget({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    if (data.isLoading) return MSLoading();

    // if (
    //   data.ability == null ||
    //   data.basicInfo == null ||
    //   data.propensity == null ||
    //   data.popularity == null ||
    //   data.itemEquipment == null ||
    //   data.cashItemEquipment == null ||
    //   data.setEffect == null ||
    //   data.symbolEquipment == null ||
    //   data.stat == null ||
    //   data.hyperStat == null ||
    //   data.petEquipment == null ||
    //   data.beautyEquipment == null ||
    //   data.androidEquipment == null ||
    //   data.skillInfo == null ||
    //   data.linkSkill == null ||
    //   data.vMatrixInfo == null ||
    //   data.hexaMatrixInfo == null ||
    //   data.hexaMatrixStat == null ||
    //   data.studioTopRecordInfo == null
    // ) {
    //   debugPrint("@@@@@ HomeState : data 가 null 입니다.");
    //   return MSEmpty();
    // }

    return Center(child: MSText("tlqkf ${data.basicInfo?.characterName}"),);
  }
}
