import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_story_book/core/util/util.dart';

part 'hexa_matrix_info.freezed.dart';
part 'hexa_matrix_info.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : hexa_matrix_info.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 19..
/// Description      :
///

@freezed
class HexaMatrixInfo with _$HexaMatrixInfo {
  const factory HexaMatrixInfo({
    String? date,
    @JsonKey(name: 'character_hexa_core_equipment') @Default([]) List<HexaCoreEquipmentElement> characterHexaCoreEquipment,
  }) = _HexaMatrixInfo;

  factory HexaMatrixInfo.fromJson(Map<String, dynamic> json) =>
      _$HexaMatrixInfoFromJson(json);
}

@freezed
class HexaCoreEquipmentElement with _$HexaCoreEquipmentElement {
  const factory HexaCoreEquipmentElement({
    @JsonKey(name: 'hexa_core_name') @Default('') String hexaCoreName,
    @JsonKey(name: 'hexa_core_level') @Default(0) int hexaCoreLevel,
    @JsonKey(name: 'hexa_core_type') @Default('') String hexaCoreType,
    @JsonKey(name: 'linked_skill') @Default([]) List<LinkedSkillElement> linkedSkill,
  }) = _HexaCoreEquipmentElement;

  factory HexaCoreEquipmentElement.fromJson(Map<String, dynamic> json) =>
      _$HexaCoreEquipmentElementFromJson(json);
}

@freezed
class LinkedSkillElement with _$LinkedSkillElement {
  const factory LinkedSkillElement({
    @JsonKey(name: 'hexa_skill_id') @Default('') String hexaSkillId,
  }) = _LinkedSkillElement;

  factory LinkedSkillElement.fromJson(Map<String, dynamic> json) =>
      _$LinkedSkillElementFromJson(json);
}
