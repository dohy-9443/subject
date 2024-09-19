import 'package:freezed_annotation/freezed_annotation.dart';

part 'ranking_achievement.freezed.dart';
part 'ranking_achievement.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : ranking_achievement.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 19..
/// Description      :
///

@freezed
class RankingAchievement with _$RankingAchievement {
  const factory RankingAchievement({
    @Default([]) List<RankingAchievementElement> ranking,
  }) = _RankingAchievement;

  factory RankingAchievement.fromJson(Map<String, dynamic> json) =>
      _$RankingAchievementFromJson(json);
}

@freezed
class RankingAchievementElement with _$RankingAchievementElement {
  const factory RankingAchievementElement({
    @Default('') String date,
    @Default(0) int ranking,
    @JsonKey(name: 'character_name') @Default('') String characterName,
    @JsonKey(name: 'world_name') @Default('') String worldName,
    @JsonKey(name: 'class_name') @Default('') String className,
    @JsonKey(name: 'sub_class_name') @Default('') String subClassName,
    @JsonKey(name: 'character_level') @Default(0) int characterLevel,
    @JsonKey(name: 'trophy_grade') @Default('') String trophyGrade,
    @JsonKey(name: 'trophy_score') @Default(0) int trophyScore,
  }) = _RankingAchievementElement;

  factory RankingAchievementElement.fromJson(Map<String, dynamic> json) =>
      _$RankingAchievementElementFromJson(json);
}