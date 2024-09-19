import 'package:freezed_annotation/freezed_annotation.dart';

part 'hexa_matrix_stat.freezed.dart';
part 'hexa_matrix_stat.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : hexa_matrix_stat.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 19..
/// Description      :
///

@freezed
class HexaMatrixStat with _$HexaMatrixStat {
  const factory HexaMatrixStat({
    String? date,
    @JsonKey(name: 'character_class') @Default('') String characterClass,
    @JsonKey(name: 'character_hexa_stat_core') @Default([]) List<HexaStatCoreElement> characterHexaStatCoreFirst,
    @JsonKey(name: 'character_hexa_stat_core_2') @Default([]) List<HexaStatCoreElement> characterHexaStatCoreSecond,
    @JsonKey(name: 'preset_hexa_stat_core') @Default([]) List<HexaStatCoreElement> presetHexaStatCoreFirst,
    @JsonKey(name: 'preset_hexa_stat_core_2') @Default([]) List<HexaStatCoreElement> presetHexaStatCoreSecond,
  }) = _HexaMatrixStat;

  factory HexaMatrixStat.fromJson(Map<String, dynamic> json) =>
      _$HexaMatrixStatFromJson(json);
}

@freezed
class HexaStatCoreElement with _$HexaStatCoreElement {
  const factory HexaStatCoreElement({
    @JsonKey(name: 'slot_id') @Default('') String slotId,
    @JsonKey(name: 'main_stat_name') @Default('') String mainStatName,
    @JsonKey(name: 'sub_stat_name_1') @Default('') String subStatNameFirst,
    @JsonKey(name: 'sub_stat_name_2') @Default('') String subStatNameSecond,
    @JsonKey(name: 'main_stat_level') @Default(0) int mainStatLevel,
    @JsonKey(name: 'sub_stat_level_1') @Default(0) int subStatLevelFirst,
    @JsonKey(name: 'sub_stat_level_2') @Default(0) int subStatLevelSecond,
    @JsonKey(name: 'stat_grade') @Default(0) int statGrade,
  }) = _HexaStatCoreElement;

  factory HexaStatCoreElement.fromJson(Map<String, dynamic> json) =>
      _$HexaStatCoreElementFromJson(json);
}
