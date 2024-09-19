import 'package:freezed_annotation/freezed_annotation.dart';

part 'ranking_studio.freezed.dart';
part 'ranking_studio.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : ranking_studio.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 19..
/// Description      :
///

@freezed
class RankingStudio with _$RankingStudio {
  const factory RankingStudio({
    @Default([]) List<RankingStudioElement> ranking,
  }) = _RankingStudio;

  factory RankingStudio.fromJson(Map<String, dynamic> json) =>
      _$RankingStudioFromJson(json);
}

@freezed
class RankingStudioElement with _$RankingStudioElement {
  const factory RankingStudioElement({
    @Default('') String date,
    @Default(0) int ranking,
    @JsonKey(name: 'character_name') @Default('') String characterName,
    @JsonKey(name: 'world_name') @Default('') String worldName,
    @JsonKey(name: 'class_name') @Default('') String className,
    @JsonKey(name: 'sub_class_name') @Default('') String subClassName,
    @JsonKey(name: 'character_level') @Default(0) int characterLevel,
    @JsonKey(name: 'dojang_floor') @Default(0) int studioFloor,
    @JsonKey(name: 'dojang_time_record') @Default(0) int studioTimeRecord,
  }) = _RankingStudioElement;

  factory RankingStudioElement.fromJson(Map<String, dynamic> json) =>
      _$RankingStudioElementFromJson(json);
}