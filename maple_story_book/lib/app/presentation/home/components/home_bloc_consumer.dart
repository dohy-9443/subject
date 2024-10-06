import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_bloc.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_state.dart';
import 'package:maple_story_book/app/presentation/home/components/components.dart';
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
          initial: () => const HomeInitialWidget(),
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
            return HomeSuccessWidget(
              isLoading: isLoading,
              ability: ability,
              basicInfo: basicInfo,
              propensity: propensity,
              popularity: popularity,
              itemEquipment: itemEquipment,
              cashItemEquipment: cashItemEquipment,
              setEffect: setEffect,
              symbolEquipment: symbolEquipment,
              stat: stat,
              hyperStat: hyperStat,
              petEquipment: petEquipment,
              beautyEquipment: beautyEquipment,
              androidEquipment: androidEquipment,
              skillInfo: skillInfo,
              linkSkill: linkSkill,
              vMatrixInfo: vMatrixInfo,
              hexaMatrixInfo: hexaMatrixInfo,
              hexaMatrixStat: hexaMatrixStat,
              studioTopRecordInfo: studioTopRecordInfo,
            );
          },
          error: (error, stackTrace) {
            return HomeErrorWidget(error: error);
          },
          orElse: () {
            return const MSText("state가 없는데?");
          }
        );
      },
    );
  }
}
