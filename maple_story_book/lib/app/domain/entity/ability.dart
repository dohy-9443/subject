import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_story_book/core/util/json.dart';

part 'ability.freezed.dart';
part 'ability.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : ability.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 19..
/// Description      : 
///

@freezed
class Ability with _$Ability {
  const factory Ability({
    String? date,
    @JsonKey(name: 'ability_grade') @Default('') String abilityGrade,
    @JsonKey(name: 'ability_info') @Default([]) List<AbilityElement> abilityInfo,
    @JsonKey(name: 'remain_fame') @Default(0) int remainFame,
    @JsonKey(name: 'preset_no') @Default(0) int presetNo,
    @JsonKey(name: 'ability_preset_1') AbilityPreset? abilityPreset1,
    @JsonKey(name: 'ability_preset_2') AbilityPreset? abilityPreset2,
    @JsonKey(name: 'ability_preset_3') AbilityPreset? abilityPreset3,
  }) = _Ability;

  factory Ability.fromJson(Map<String, dynamic> json) => _$AbilityFromJson(json);
}

@freezed
class AbilityPreset with _$AbilityPreset {
  const factory AbilityPreset({
    @JsonKey(name: 'ability_preset_grade') @Default('') String abilityPresetGrade,
    @JsonKey(name: 'ability_info') @Default([]) List<AbilityElement> abilityInfo,
  }) = _AbilityPreset;

  factory AbilityPreset.fromJson(Map<String, dynamic> json) => _$AbilityPresetFromJson(json);
}

@freezed
class AbilityElement with _$AbilityElement {
  const factory AbilityElement({
    @JsonKey(name: 'ability_no', fromJson: stringToConvertInt) @Default(0) int abilityNo,
    @JsonKey(name: 'ability_grade') @Default('') String abilityGrade,
    @JsonKey(name: 'ability_value') @Default('') String abilityValue,
  }) = _AbilityElement;

  factory AbilityElement.fromJson(Map<String, dynamic> json) => _$AbilityElementFromJson(json);
}