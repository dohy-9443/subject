import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/core/util/bloc/bloc.dart';
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

@freezed
class HomeState with _$HomeState implements BaseState {
  const HomeState._();

  const factory HomeState.initial() = HomeInitial;
  const factory HomeState.loading() = HomeLoading;
  const factory HomeState.success({
    @Default(Ability(abilityPreset1: AbilityPreset(), abilityPreset2: AbilityPreset(), abilityPreset3: AbilityPreset())) Ability ability,
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
  }) = HomeSuccess;

  const factory HomeState.error({required String errorMessage}) = HomeError;

  @override
  // TODO: implement isError
  bool get isError => this is HomeError;

  @override
  // TODO: implement isInitial
  bool get isInitial => this is HomeInitial;

  @override
  // TODO: implement isLoading
  bool get isLoading => this is HomeLoading;

  @override
  // TODO: implement isSuccess
  bool get isSuccess => this is HomeSuccess;

  @override
  // TODO: implement error
  get error => this is HomeError ? (this as HomeError).errorMessage : null;
}