import 'package:equatable/equatable.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_state.
/// @Created by      : shineheetae.
/// Created On       : 2024. 9. 18..
/// Description      : ability(어빌리티) 0, basic(기본정보) 0, propensity(성향 정보) 0, stat(종합능력치) 0,
/// hyper-stat(하이퍼 스탯) 0, item-equipment(장착 장비 정보) 0, cash item-equipment(캐시 장비 정보) 0,
/// symbol-equipment(심볼 정보) 0, set-effect(적용 세트 효과) 0, pet-equipment(장착 펫 정보) 0,
///

sealed class IHomeState extends Equatable {}

class HomeInitial extends IHomeState {
  HomeInitial();

  @override
  List<Object?> get props => [];
}

class HomeSuccess extends IHomeState {
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

  HomeSuccess({
    this.isLoading = false,
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

  HomeSuccess copyWith({
    bool? isLoading,
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
    return HomeSuccess(
      isLoading: isLoading ?? this.isLoading,
      ability: ability ?? this.ability,
      basicInfo: basicInfo ?? this.basicInfo,
      propensity: propensity ?? this.propensity,
      popularity: popularity ?? this.popularity,
      itemEquipment: itemEquipment ?? this.itemEquipment,
      cashItemEquipment: cashItemEquipment ?? this.cashItemEquipment,
      setEffect: setEffect ?? this.setEffect,
      symbolEquipment: symbolEquipment ?? this.symbolEquipment,
      stat: stat ?? this.stat,
      hyperStat: hyperStat ?? this.hyperStat,
      petEquipment: petEquipment ?? this.petEquipment,
      beautyEquipment: beautyEquipment ?? this.beautyEquipment,
      androidEquipment: androidEquipment ?? this.androidEquipment,
      skillInfo: skillInfo ?? this.skillInfo,
      linkSkill: linkSkill ?? this.linkSkill,
      vMatrixInfo: vMatrixInfo ?? this.vMatrixInfo,
      hexaMatrixInfo: hexaMatrixInfo ?? this.hexaMatrixInfo,
      hexaMatrixStat: hexaMatrixStat ?? this.hexaMatrixStat,
      studioTopRecordInfo: studioTopRecordInfo ?? this.studioTopRecordInfo,
    );
  }

  @override
  List<Object?> get props => [
    isLoading, ability, basicInfo,
    propensity, popularity, itemEquipment,
    cashItemEquipment, setEffect, symbolEquipment,
    stat, hyperStat, petEquipment,
    beautyEquipment, androidEquipment, skillInfo,
    linkSkill, vMatrixInfo, hexaMatrixInfo,
    hexaMatrixStat, studioTopRecordInfo
  ];
}

class HomeError extends IHomeState {
  final dynamic error;
  final StackTrace? stackTrace;

  HomeError({required this.error, required this.stackTrace});

  @override
  List<Object?> get props => [];
}
