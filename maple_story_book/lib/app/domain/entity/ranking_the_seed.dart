import 'package:freezed_annotation/freezed_annotation.dart';

part 'ranking_the_seed.freezed.dart';
part 'ranking_the_seed.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : ranking_the_seed.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 19..
/// Description      :
///

@freezed
class RankingTheSeed with _$RankingTheSeed {
  const factory RankingTheSeed({
    @Default([]) List<RankingTheSeedElement> ranking,
  }) = _RankingTheSeed;

  factory RankingTheSeed.fromJson(Map<String, dynamic> json) =>
      _$RankingTheSeedFromJson(json);
}

@freezed
class RankingTheSeedElement with _$RankingTheSeedElement {
  const factory RankingTheSeedElement({
    @Default('') String date,
    @Default(0) int ranking,
    @JsonKey(name: 'character_name') @Default('') String characterName,
    @JsonKey(name: 'world_name') @Default('') String worldName,
    @JsonKey(name: 'class_name') @Default('') String className,
    @JsonKey(name: 'sub_class_name') @Default('') String subClassName,
    @JsonKey(name: 'character_level') @Default(0) int characterLevel,
    @JsonKey(name: 'theseed_floor') @Default(0) int theSeedFloor,
    @JsonKey(name: 'theseed_time_record') @Default(0) int theSeedTimeRecord,
  }) = _RankingTheSeedElement;

  factory RankingTheSeedElement.fromJson(Map<String, dynamic> json) =>
      _$RankingTheSeedElementFromJson(json);
}