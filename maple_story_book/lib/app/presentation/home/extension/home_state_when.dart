import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_state.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_state_when.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 7..
/// Description      : 
///

extension HomeStateWhen on IHomeState {
  TResult when<TResult>({
    required TResult Function() initial,
    required TResult Function({
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
    }) success,
    required TResult Function(dynamic error, StackTrace? stackTrace) error,
    required TResult Function() orElse,
  }) {
    if (this is HomeInitial) return initial();
    if (this is HomeSuccess) {
      final successState = this as HomeSuccess;
      return success(
        isLoading: successState.isLoading,
        ability: successState.ability,
        basicInfo: successState.basicInfo,
        propensity: successState.propensity,
        popularity: successState.popularity,
        itemEquipment: successState.itemEquipment,
        cashItemEquipment: successState.cashItemEquipment,
        setEffect: successState.setEffect,
        symbolEquipment: successState.symbolEquipment,
        stat: successState.stat,
        hyperStat: successState.hyperStat,
        petEquipment: successState.petEquipment,
        beautyEquipment: successState.beautyEquipment,
        androidEquipment: successState.androidEquipment,
        skillInfo: successState.skillInfo,
        linkSkill: successState.linkSkill,
        vMatrixInfo: successState.vMatrixInfo,
        hexaMatrixInfo: successState.hexaMatrixInfo,
        hexaMatrixStat: successState.hexaMatrixStat,
        studioTopRecordInfo: successState.studioTopRecordInfo,
      );
    }
    if (this is HomeError) {
      final errorState = this as HomeError;

      return error(errorState.error, errorState.stackTrace);
    }

    return orElse();
  }
}