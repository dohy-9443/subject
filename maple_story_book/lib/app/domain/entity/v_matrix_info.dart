import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_story_book/core/util/util.dart';

part 'v_matrix_info.freezed.dart';
part 'v_matrix_info.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : v_matrix_info.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 19..
/// Description      :
///

@freezed
class VMatrixInfo with _$VMatrixInfo {
  const factory VMatrixInfo({
    String? date,
    @JsonKey(name: 'character_class') @Default('') String characterClass,
    @JsonKey(name: 'character_v_core_equipment') @Default([]) List<CharacterVCoreEquipmentElement> characterVCoreEquipment,
    @JsonKey(name: 'character_v_matrix_remain_slot_upgrade_point') @Default(0) int characterVMatrixRemainSlotUpgradePoint,
  }) = _VMatrixInfo;

  factory VMatrixInfo.fromJson(Map<String, dynamic> json) =>
      _$VMatrixInfoFromJson(json);
}

@freezed
class CharacterVCoreEquipmentElement with _$CharacterVCoreEquipmentElement {
  const factory CharacterVCoreEquipmentElement({
    @JsonKey(name: 'slot_id') @Default('') String slotId,
    @JsonKey(name: 'slot_level') @Default(0) int slotLevel,
    @JsonKey(name: 'v_core_name') @Default('') String vCoreName,
    @JsonKey(name: 'v_core_type') @Default('') String vCoreType,
    @JsonKey(name: 'v_core_level') @Default('') String vCoreLevel,
    @JsonKey(name: 'v_core_skill_1') @Default('') String vCoreSkillFirst,
    @JsonKey(name: 'v_core_skill_2') @Default('') String vCoreSkillSecond,
    @JsonKey(name: 'v_core_skill_3') @Default('') String vCoreSkillThird,
  }) = _CharacterVCoreEquipmentElement;

  factory CharacterVCoreEquipmentElement.fromJson(Map<String, dynamic> json) =>
      _$CharacterVCoreEquipmentElementFromJson(json);
}

