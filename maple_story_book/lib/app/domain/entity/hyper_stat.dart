import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_story_book/core/util/util.dart';

part 'hyper_stat.freezed.dart';
part 'hyper_stat.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : hyper_stat.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 19..
/// Description      : 
///

@freezed
class HyperStat with _$HyperStat {
  const factory HyperStat({
    String? date,
    @JsonKey(name: 'character_class') @Default('') String characterClass,
    @JsonKey(name: 'use_preset_no', fromJson: stringToConvertInt) @Default(0) int usePresetNo,
    @JsonKey(name: 'use_available_hyper_stat') @Default(0) int useAvailableHyperStat,
    @JsonKey(name: 'hyper_stat_preset_1') @Default([]) List<HyperStatElement> hyperStatPreset1,
    @JsonKey(name: 'hyper_stat_preset_1_remain_point') @Default(0) int hyperStatPreset1RemainPoint,
    @JsonKey(name: 'hyper_stat_preset_2') @Default([]) List<HyperStatElement> hyperStatPreset2,
    @JsonKey(name: 'hyper_stat_preset_2_remain_point') @Default(0) int hyperStatPreset2RemainPoint,
    @JsonKey(name: 'hyper_stat_preset_3') @Default([]) List<HyperStatElement> hyperStatPreset3,
    @JsonKey(name: 'hyper_stat_preset_3_remain_point') @Default(0) int hyperStatPreset3RemainPoint,
  }) = _HyperStat;

  factory HyperStat.fromJson(Map<String, dynamic> json) => _$HyperStatFromJson(json);
}

@freezed
class HyperStatElement with _$HyperStatElement {
  const factory HyperStatElement({
    @JsonKey(name: 'stat_type') @Default('') String statType,
    @JsonKey(name: 'stat_point') @Default(0) int statPoint,
    @JsonKey(name: 'stat_level') @Default(0) int statLevel,
    @JsonKey(name: 'stat_increase') @Default('') String statIncrease,
  }) = _HyperStatElement;

  factory HyperStatElement.fromJson(Map<String, dynamic> json) => _$HyperStatElementFromJson(json);
}