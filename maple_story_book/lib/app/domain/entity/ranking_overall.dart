import 'package:freezed_annotation/freezed_annotation.dart';

part 'ranking_overall.freezed.dart';
part 'ranking_overall.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : ranking_overall.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 19..
/// Description      :
///

@freezed
class RankingOverall with _$RankingOverall {
  const factory RankingOverall({
    @Default([]) List<RankingOverallElement> ranking,
  }) = _RankingOverall;

  factory RankingOverall.fromJson(Map<String, dynamic> json) =>
      _$RankingOverallFromJson(json);
}

@freezed
class RankingOverallElement with _$RankingOverallElement {
  const factory RankingOverallElement({
    @Default('') String date,
    @Default(0) int ranking,
    @JsonKey(name: 'character_name') @Default('') String characterName,
    @JsonKey(name: 'world_name') @Default('') String worldName,
    @JsonKey(name: 'class_name') @Default('') String className,
    @JsonKey(name: 'sub_class_name') @Default('') String subClassName,
    @JsonKey(name: 'character_level') @Default(0) int characterLevel,
    @JsonKey(name: 'character_exp') @Default(0) int characterExp,
    @JsonKey(name: 'character_popularity') @Default(0) int characterPopularity,
    @JsonKey(name: 'character_guildname') @Default('') String characterGuildName,
  }) = _RankingOverallElement;

  factory RankingOverallElement.fromJson(Map<String, dynamic> json) =>
      _$RankingOverallElementFromJson(json);
}