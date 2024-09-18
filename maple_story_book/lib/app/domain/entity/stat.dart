import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_story_book/core/util/util.dart';

part 'stat.freezed.dart';
part 'stat.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : stat.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 18..
/// Description      : 
///

@freezed
class Stat with _$Stat {
  const factory Stat({
    String? date,
    @JsonKey(name: 'character_class') @Default('') String characterClass,
    @JsonKey(name: 'final_stat') @Default([]) List<StatElement> finalStat,
    @JsonKey(name: 'remain_ap') @Default(0.0) double remainAp,
  }) = _Stat;

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);
}

@freezed
class StatElement with _$StatElement {
  const factory StatElement({
    @JsonKey(name: 'stat_name') @Default('') String statName,
    @JsonKey(name: 'stat_value', fromJson: stringToConvertDouble) @Default(0.0) double statValue,
  }) = _StatElement;

  factory StatElement.fromJson(Map<String, dynamic> json) => _$StatElementFromJson(json);
}