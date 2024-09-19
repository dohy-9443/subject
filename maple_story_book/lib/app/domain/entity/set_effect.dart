import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_effect.freezed.dart';
part 'set_effect.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : set_effect.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 20..
/// Description      : 
///

@freezed
class SetEffect with _$SetEffect {
  const factory SetEffect({
    String? date,
    @JsonKey(name: 'set_effect') @Default([]) List<SetEffectElement> setEffectList,
  }) = _SetEffect;

  factory SetEffect.fromJson(Map<String, dynamic> json) => _$SetEffectFromJson(json);
}

@freezed
class SetEffectElement with _$SetEffectElement {
  const factory SetEffectElement({
    @JsonKey(name: 'set_name') @Default('') String setName,
    @JsonKey(name: 'total_set_count') @Default(0) int totalSetCount,
    @JsonKey(name: 'set_effect_info') @Default([]) List<SetInfo> setEffectInfo,
    @JsonKey(name: 'set_option_full') @Default([]) List<SetInfo> setOptionFull,

  }) = _SetEffectElement;

  factory SetEffectElement.fromJson(Map<String, dynamic> json) => _$SetEffectElementFromJson(json);
}

@freezed
class SetInfo with _$SetInfo {
  const factory SetInfo({
    @JsonKey(name: 'set_count') @Default(0) int setCount,
    @JsonKey(name: 'set_option') @Default('') String setOption,
  }) = _SetInfo;

  factory SetInfo.fromJson(Map<String, dynamic> json) => _$SetInfoFromJson(json);
}