import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_story_book/core/util/util.dart';

part 'union_raider.freezed.dart';
part 'union_raider.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : union_raider.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 19..
/// Description      :
///

@freezed
class UnionRaider with _$UnionRaider {
  const factory UnionRaider({
    @Default('') String date,
    required UnionRaiderPresetElement unionPreset,
    @JsonKey(name: 'use_preset_no', fromJson: stringToConvertInt) @Default(0) int usePresetNo,
    @JsonKey(name: 'union_raider_preset_1') @Default([]) List<UnionRaiderPresetElement> unionRaiderPresetFirst,
    @JsonKey(name: 'union_raider_preset_2') @Default([]) List<UnionRaiderPresetElement> unionRaiderPresetSecond,
    @JsonKey(name: 'union_raider_preset_3') @Default([]) List<UnionRaiderPresetElement> unionRaiderPresetThird,
    @JsonKey(name: 'union_raider_preset_4') @Default([]) List<UnionRaiderPresetElement> unionRaiderPresetFourth,
    @JsonKey(name: 'union_raider_preset_5') @Default([]) List<UnionRaiderPresetElement> unionRaiderPresetFifth,
  }) = _UnionRaider;

  factory UnionRaider.fromJson(Map<String, dynamic> json) =>
      _$UnionRaiderFromJson(json);
}

@freezed
class UnionInnerStatElement with _$UnionInnerStatElement {
  const factory UnionInnerStatElement({
    @JsonKey(name: 'stat_field_id') @Default('') String statFieldId,
    @JsonKey(name: 'stat_field_effect') @Default('') String statFieldEffect,
  }) = _UnionInnerStatElement;

  factory UnionInnerStatElement.fromJson(Map<String, dynamic> json) =>
      _$UnionInnerStatElementFromJson(json);
}

@freezed
class UnionBlockElement with _$UnionBlockElement {
  const factory UnionBlockElement({
    @JsonKey(name: 'block_type') @Default('') String blockType,
    @JsonKey(name: 'block_class') @Default('') String blockClass,
    @JsonKey(name: 'block_level') @Default('') String blockLevel,
    @JsonKey(name: 'block_control_point') required Position blockControlPoint,
    @JsonKey(name: 'block_position') @Default([])  List<Position> blockPosition,
  }) = _UnionBlockElement;

  factory UnionBlockElement.fromJson(Map<String, dynamic> json) =>
      _$UnionBlockElementFromJson(json);
}

@freezed
class Position with _$Position {
  const factory Position({
  @Default(0) int x,
  @Default(0) int y,
}) = _Position;

factory Position.fromJson(Map<String, dynamic> json) =>
_$PositionFromJson(json);
}

@freezed
class UnionRaiderPresetElement with _$UnionRaiderPresetElement {
  const factory UnionRaiderPresetElement({
    @JsonKey(name: 'union_raider_stat') @Default([]) List<String> unionRaiderStat,
    @JsonKey(name: 'union_occupied_stat') @Default([]) List<String> unionOccupiedStat,
    @JsonKey(name: 'union_inner_stat') @Default([]) List<UnionInnerStatElement> unionInnerStat,
    @JsonKey(name: 'union_block') @Default([]) List<UnionBlockElement> unionBlock,
  }) = _UnionRaiderPresetElement;

  factory UnionRaiderPresetElement.fromJson(Map<String, dynamic> json) =>
      _$UnionRaiderPresetElementFromJson(json);
}