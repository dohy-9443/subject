import 'package:flutter/material.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_success_widget.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 7..
/// Description      : 
///

class HomeSuccessWidget extends StatelessWidget {
  final bool isLoading;
  final Ability? ability;
  final BasicInfo? basicInfo;
  final Propensity? propensity;
  final Popularity? popularity;
  final ItemEquipment? itemEquipment;
  final CashItemEquipment? cashItemEquipment;
  final SetEffect? setEffect;
  final SymbolEquipment? symbolEquipment;
  final Stat? stat;
  final HyperStat? hyperStat;
  final PetEquipment? petEquipment;
  final BeautyEquipment? beautyEquipment;
  final AndroidEquipment? androidEquipment;
  final SkillInfo? skillInfo;
  final LinkSkill? linkSkill;
  final VMatrixInfo? vMatrixInfo;
  final HexaMatrixInfo? hexaMatrixInfo;
  final HexaMatrixStat? hexaMatrixStat;
  final StudioTopRecordInfo? studioTopRecordInfo;

  const HomeSuccessWidget({
    super.key,
    required this.isLoading,
    this.ability,
    this.basicInfo,
    this.propensity,
    this.popularity,
    this.itemEquipment,
    this.cashItemEquipment,
    this.setEffect,
    this.symbolEquipment,
    this.stat,
    this.hyperStat,
    this.petEquipment,
    this.beautyEquipment,
    this.androidEquipment,
    this.skillInfo,
    this.linkSkill,
    this.vMatrixInfo,
    this.hexaMatrixInfo,
    this.hexaMatrixStat,
    this.studioTopRecordInfo,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) return MSText.bold("로딩중");

    if (
      ability == null ||
      basicInfo == null ||
      propensity == null ||
      popularity == null ||
      itemEquipment == null ||
      cashItemEquipment == null ||
      setEffect == null ||
      symbolEquipment == null ||
      stat == null ||
      hyperStat == null ||
      petEquipment == null ||
      beautyEquipment == null ||
      androidEquipment == null ||
      skillInfo == null ||
      linkSkill == null ||
      vMatrixInfo == null ||
      hexaMatrixInfo == null ||
      hexaMatrixStat == null ||
      studioTopRecordInfo == null
    ) {
      debugPrint("@@@@@ HomeState : data 가 null 입니다.");
      return const MSText("data 가 없습니다.");
    }

    return Center();
  }
}
