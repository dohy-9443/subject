import 'package:freezed_annotation/freezed_annotation.dart';

part 'star_force_history.freezed.dart';

part 'star_force_history.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : starforce_history.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 19..
/// Description      :
///

@freezed
class StarForceHistory with _$StarForceHistory {
  const factory StarForceHistory({
    @Default(0) int count,
    @JsonKey(name: 'next_cursor') @Default('') String nextCursor,
    @JsonKey(name: 'starforce_history') @Default([]) List<StarForceHistoryElement> starForceHistory,
  }) = _StarForceHistory;

  factory StarForceHistory.fromJson(Map<String, dynamic> json) => _$StarForceHistoryFromJson(json);
}

@freezed
class StarForceHistoryElement with _$StarForceHistoryElement {
  const factory StarForceHistoryElement({
    @Default('') String id,
    @JsonKey(name: 'character_name') @Default('') String characterName,
    @JsonKey(name: 'item_upgrade_result') @Default('') String itemUpgradeResult,
    @JsonKey(name: 'before_starforce_count') @Default(0) int beforeStarForceCount,
    @JsonKey(name: 'after_starforce_count') @Default(0) int afterStarForceCount,
    @JsonKey(name: 'starcatch_result') @Default('') String starCatchResult,
    @JsonKey(name: 'superior_item_flag') @Default('') String superiorItemFlag,
    @JsonKey(name: 'destroy_defence') @Default('') String destroyDefence,
    @JsonKey(name: 'chance_time') @Default('') String chanceTime,
    @JsonKey(name: 'event_field_flag') @Default('') String eventFieldFlag,
    @JsonKey(name: 'upgrade_item') @Default('') String upgradeItem,
    @JsonKey(name: 'protect_shield') @Default('') String protectShield,
    @JsonKey(name: 'bonus_stat_upgrade') @Default('') String bonusStatUpgrade,
    @JsonKey(name: 'world_name') @Default('') String worldName,
    @JsonKey(name: 'target_item') @Default('') String targetItem,
    @JsonKey(name: 'date_create') String? dateCreate,
    @JsonKey(name: 'starforce_event_list') @Default([]) List<StarForceEventElement> starForceEventList,
  }) = _StarForceHistoryElement;

  factory StarForceHistoryElement.fromJson(Map<String, dynamic> json) => _$StarForceHistoryElementFromJson(json);
}

@freezed
class StarForceEventElement with _$StarForceEventElement {
  const factory StarForceEventElement({
    @JsonKey(name: 'success_rate') @Default('') String successRate,
    @JsonKey(name: 'cost_discount_rate') @Default('') String costDiscountRate,
    @JsonKey(name: 'plus_value') @Default('') String plusValue,
    @JsonKey(name: 'starforce_event_range') @Default('') String starForceEventRange,
  }) = _StarForceEventElement;

  factory StarForceEventElement.fromJson(Map<String, dynamic> json) => _$StarForceEventElementFromJson(json);
}
