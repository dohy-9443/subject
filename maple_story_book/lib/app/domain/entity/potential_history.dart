import 'package:freezed_annotation/freezed_annotation.dart';

import 'cube_history.dart';

part 'potential_history.freezed.dart';

part 'potential_history.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : potential_history.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 19..
/// Description      :
///

@freezed
class PotentialHistory with _$PotentialHistory {
  const factory PotentialHistory({
    @Default(0) int count,
    @JsonKey(name: 'next_cursor') @Default('') String nextCursor,
    @JsonKey(name: 'potential_history') @Default([]) List<PotentialHistoryElement> potentialHistory,
  }) = _PotentialHistory;

  factory PotentialHistory.fromJson(Map<String, dynamic> json) => _$PotentialHistoryFromJson(json);
}

@freezed
class PotentialHistoryElement with _$PotentialHistoryElement {
  const factory PotentialHistoryElement({
    @Default('') String id,
    @JsonKey(name: 'character_name') @Default('') String characterName,
    @JsonKey(name: 'date_create') String? dateCreate,
    @JsonKey(name: 'potential_type') @Default('') String potentialType,
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
  }) = _PotentialHistoryElement;

  factory PotentialHistoryElement.fromJson(Map<String, dynamic> json) => _$PotentialHistoryElementFromJson(json);
}
