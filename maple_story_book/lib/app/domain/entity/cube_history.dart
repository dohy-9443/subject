import 'package:freezed_annotation/freezed_annotation.dart';

part 'cube_history.freezed.dart';

part 'cube_history.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : cube_history.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 19..
/// Description      :
///

@freezed
class CubeHistory with _$CubeHistory {
  const factory CubeHistory({
    @Default(0) int count,
    @JsonKey(name: 'next_cursor') @Default('') String nextCursor,
    @JsonKey(name: 'cube_history') @Default([]) List<CubeHistoryElement> cubeHistory,
  }) = _CubeHistory;

  factory CubeHistory.fromJson(Map<String, dynamic> json) => _$CubeHistoryFromJson(json);
}

@freezed
class CubeHistoryElement with _$CubeHistoryElement {
  const factory CubeHistoryElement({
    @Default('') String id,
    @JsonKey(name: 'character_name') @Default('') String characterName,
    @JsonKey(name: 'date_create') String? dateCreate,
    @JsonKey(name: 'cube_type') @Default('') String cubeType,
    @JsonKey(name: 'item_upgrade_result') @Default('') String itemUpgradeResult,
    @JsonKey(name: 'miracle_time_flag') @Default('') String miracleTimeFlag,
    @JsonKey(name: 'item_equipment_part') @Default('') String itemEquipmentPart,
    @JsonKey(name: 'item_level') @Default(0) int itemLevel,
    @JsonKey(name: 'target_item') @Default('') String targetItem,
    @JsonKey(name: 'potential_option_grade') @Default('') String potentialOptionGrade,
    @JsonKey(name: 'additional_potential_option_grade') @Default('') String additionalPotentialOptionGrade,
    @JsonKey(name: 'upgrade_guarantee') @Default(false) bool upgradeGuarantee,
    @JsonKey(name: 'upgrade_guarantee_count') @Default(0) int upgradeGuaranteeCount,
    @JsonKey(name: 'before_potential_option') @Default([]) List<OptionElement> beforePotentialOption,
    @JsonKey(name: 'before_additional_potential_option') @Default([]) List<OptionElement> beforeAdditionalPotentialOption,
    @JsonKey(name: 'after_potential_option') @Default([]) List<OptionElement> afterPotentialOption,
    @JsonKey(name: 'after_additional_potential_option') @Default([]) List<OptionElement> afterAdditionalPotentialOption,
  }) = _CubeHistoryElement;

  factory CubeHistoryElement.fromJson(Map<String, dynamic> json) => _$CubeHistoryElementFromJson(json);
}

@freezed
class OptionElement with _$OptionElement {
  const factory OptionElement({
    @Default('') String value,
    @Default('') String grade,
  }) = _OptionElement;

  factory OptionElement.fromJson(Map<String, dynamic> json) => _$OptionElementFromJson(json);
}
