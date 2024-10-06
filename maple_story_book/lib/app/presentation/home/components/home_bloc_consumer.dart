import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_bloc.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_state.dart';
import 'package:maple_story_book/app/presentation/home/extension/home_state_when.dart';
import 'package:maple_story_book/tool/widget/widget.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_bloc_consumer.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 7..
/// Description      : 
///

class HomeBlocConsumer extends StatelessWidget {
  final Widget child;

  const HomeBlocConsumer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, IHomeState>(
      listener: (BuildContext context, IHomeState state) {

      },
      builder: (BuildContext context, IHomeState state) {
        return state.when(
          initial: () => Center(
            child: MSText.bold('로딩중...'),
          ),
          success: ({
            required bool isLoading,
            Ability? ability,
            BasicInfo? basicInfo,
            Propensity? propensity,
            Popularity? popularity,
            ItemEquipment? itemEquipment,
            CashItemEquipment? cashItemEquipment,
            SetEffect? setEffect,
            SymbolEquipment? symbolEquipment,
            Stat? stat,
            HyperStat? hyperStat,
            PetEquipment? petEquipment,
            BeautyEquipment? beautyEquipment,
            AndroidEquipment? androidEquipment,
            SkillInfo? skillInfo,
            LinkSkill? linkSkill,
            VMatrixInfo? vMatrixInfo,
            HexaMatrixInfo? hexaMatrixInfo,
            HexaMatrixStat? hexaMatrixStat,
            StudioTopRecordInfo? studioTopRecordInfo,
          }) {
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

            return child;
          },
          error: (error, stackTrace) {
            return MSText.danger("Error $error");
          },
          orElse: () {
            return const MSText("state가 없는데?");
          }
        );
      },
    );
  }
}
