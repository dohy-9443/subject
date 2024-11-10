import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/core/util/bloc/base_state.dart';
import 'package:maple_story_book/core/util/util.dart';

part 'home_state.freezed.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_state.
/// @Created by      : shineheetae.
/// Created On       : 2024. 9. 18..
/// Description      : ability(어빌리티) 0, basic(기본정보) 0, propensity(성향 정보) 0, stat(종합능력치) 0,
/// hyper-stat(하이퍼 스탯) 0, item-equipment(장착 장비 정보) 0, cash item-equipment(캐시 장비 정보) 0,
/// symbol-equipment(심볼 정보) 0, set-effect(적용 세트 효과) 0, pet-equipment(장착 펫 정보) 0,
///

// sealed class IHomeState extends Equatable with IBaseState {}
//
// final class HomeInitial extends IHomeState with BaseInitialState {
//   HomeInitial();
//
//   @override
//   List<Object?> get props => [];
// }
//
// final class HomeSuccess extends IHomeState with BaseSuccessState  {
//
//   final bool isLoading;
//   final Ability ability;
//   final BasicInfo basicInfo;
//   final Propensity propensity;
//   final Popularity popularity;
//   final ItemEquipment itemEquipment;
//   final CashItemEquipment cashItemEquipment;
//   final SetEffect setEffect;
//   final SymbolEquipment symbolEquipment;
//   final Stat stat;
//   final HyperStat hyperStat;
//   final PetEquipment petEquipment;
//   final BeautyEquipment beautyEquipment;
//   final AndroidEquipment androidEquipment;
//   final SkillInfo skillInfo;
//   final LinkSkill linkSkill;
//   final VMatrixInfo vMatrixInfo;
//   final HexaMatrixInfo hexaMatrixInfo;
//   final HexaMatrixStat hexaMatrixStat;
//   final StudioTopRecordInfo studioTopRecordInfo;
//
//   HomeSuccess({
//     this.isLoading = false,
//     this.ability = const Ability(abilityPreset1: AbilityPreset(), abilityPreset2: AbilityPreset(), abilityPreset3: AbilityPreset()),
//     this.basicInfo = const BasicInfo(),
//     this.propensity = const Propensity(),
//     this.popularity = const Popularity(),
//     this.itemEquipment = const ItemEquipment(),
//     this.cashItemEquipment = const CashItemEquipment(),
//     this.setEffect = const SetEffect(),
//     this.symbolEquipment = const SymbolEquipment(),
//     this.stat = const Stat(),
//     this.hyperStat = const HyperStat(),
//     this.petEquipment = const PetEquipment(),
//     this.beautyEquipment = const BeautyEquipment(),
//     this.androidEquipment = const AndroidEquipment(),
//     this.skillInfo = const SkillInfo(),
//     this.linkSkill = const LinkSkill(),
//     this.vMatrixInfo = const VMatrixInfo(),
//     this.hexaMatrixInfo = const HexaMatrixInfo(),
//     this.hexaMatrixStat = const HexaMatrixStat(),
//     this.studioTopRecordInfo = const StudioTopRecordInfo(),
//   });
//
//   HomeSuccess copyWith({
//     bool? isLoading,
//     Ability? ability,
//     BasicInfo? basicInfo,
//     Propensity? propensity,
//     Popularity? popularity,
//     ItemEquipment? itemEquipment,
//     CashItemEquipment? cashItemEquipment,
//     SetEffect? setEffect,
//     SymbolEquipment? symbolEquipment,
//     Stat? stat,
//     HyperStat? hyperStat,
//     PetEquipment? petEquipment,
//     BeautyEquipment? beautyEquipment,
//     AndroidEquipment? androidEquipment,
//     SkillInfo? skillInfo,
//     LinkSkill? linkSkill,
//     VMatrixInfo? vMatrixInfo,
//     HexaMatrixInfo? hexaMatrixInfo,
//     HexaMatrixStat? hexaMatrixStat,
//     StudioTopRecordInfo? studioTopRecordInfo,
//   }) {
//     return HomeSuccess(
//       isLoading: isLoading ?? this.isLoading,
//       ability: ability ?? this.ability,
//       basicInfo: basicInfo ?? this.basicInfo,
//       propensity: propensity ?? this.propensity,
//       popularity: popularity ?? this.popularity,
//       itemEquipment: itemEquipment ?? this.itemEquipment,
//       cashItemEquipment: cashItemEquipment ?? this.cashItemEquipment,
//       setEffect: setEffect ?? this.setEffect,
//       symbolEquipment: symbolEquipment ?? this.symbolEquipment,
//       stat: stat ?? this.stat,
//       hyperStat: hyperStat ?? this.hyperStat,
//       petEquipment: petEquipment ?? this.petEquipment,
//       beautyEquipment: beautyEquipment ?? this.beautyEquipment,
//       androidEquipment: androidEquipment ?? this.androidEquipment,
//       skillInfo: skillInfo ?? this.skillInfo,
//       linkSkill: linkSkill ?? this.linkSkill,
//       vMatrixInfo: vMatrixInfo ?? this.vMatrixInfo,
//       hexaMatrixInfo: hexaMatrixInfo ?? this.hexaMatrixInfo,
//       hexaMatrixStat: hexaMatrixStat ?? this.hexaMatrixStat,
//       studioTopRecordInfo: studioTopRecordInfo ?? this.studioTopRecordInfo,
//     );
//   }
//
//   @override
//   List<Object?> get props => [
//     isLoading, ability, basicInfo,
//     propensity, popularity, itemEquipment,
//     cashItemEquipment, setEffect, symbolEquipment,
//     stat, hyperStat, petEquipment,
//     beautyEquipment, androidEquipment, skillInfo,
//     linkSkill, vMatrixInfo, hexaMatrixInfo,
//     hexaMatrixStat, studioTopRecordInfo
//   ];
//
// }
//
// class HomeError extends IHomeState with BaseErrorState {
//   @override
//   final dynamic error;
//   @override
//   final StackTrace? stackTrace;
//
//   HomeError({required this.error, this.stackTrace});
//
//   @override
//   List<Object?> get props => [error, stackTrace];
// }


/* 테스트 */

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = Initial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.success({
    @Default(Ability(abilityPreset1: AbilityPreset(), abilityPreset2: AbilityPreset(), abilityPreset3: AbilityPreset())) Ability ability,
    @Default(BasicInfo()) BasicInfo basicInfo,
    @Default(Propensity()) Propensity propensity,
    @Default(Popularity()) Popularity popularity,
    @Default(ItemEquipment()) ItemEquipment itemEquipment,
    @Default(CashItemEquipment()) CashItemEquipment cashItemEquipment,
    @Default(SetEffect()) SetEffect setEffect,
    @Default(SymbolEquipment()) SymbolEquipment symbolEquipment,
    @Default(Stat()) Stat stat,
    @Default(HyperStat()) HyperStat hyperStat,
    @Default(PetEquipment()) PetEquipment petEquipment,
    @Default(BeautyEquipment()) BeautyEquipment beautyEquipment,
    @Default(AndroidEquipment()) AndroidEquipment androidEquipment,
    @Default(SkillInfo()) SkillInfo skillInfo,
    @Default(LinkSkill()) LinkSkill linkSkill,
    @Default(VMatrixInfo()) VMatrixInfo vMatrixInfo,
    @Default(HexaMatrixInfo()) HexaMatrixInfo hexaMatrixInfo,
    @Default(HexaMatrixStat()) HexaMatrixStat hexaMatrixStat,
    @Default(StudioTopRecordInfo()) StudioTopRecordInfo studioTopRecordInfo,
  }) = Success;
  const factory HomeState.error() = Error;
}