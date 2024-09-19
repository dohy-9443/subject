import 'package:freezed_annotation/freezed_annotation.dart';

part 'ranking_union.freezed.dart';
part 'ranking_union.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : ranking_union.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 19..
/// Description      :
///

@freezed
class RankingUnion with _$RankingUnion {
  const factory RankingUnion({
    @Default([]) List<RankingUnionElement> ranking,
  }) = _RankingUnion;

  factory RankingUnion.fromJson(Map<String, dynamic> json) =>
      _$RankingUnionFromJson(json);
}

@freezed
class RankingUnionElement with _$RankingUnionElement {
  const factory RankingUnionElement({
    @Default('') String date,
    @Default(0) int ranking,
    @JsonKey(name: 'character_name') @Default('') String characterName,
    @JsonKey(name: 'world_name') @Default('') String worldName,
    @JsonKey(name: 'class_name') @Default('') String className,
    @JsonKey(name: 'sub_class_name') @Default('') String subClassName,
    @JsonKey(name: 'union_level') @Default(0) int unionLevel,
    @JsonKey(name: 'union_power') @Default(0) int unionPower,
  }) = _RankingUnionElement;

  factory RankingUnionElement.fromJson(Map<String, dynamic> json) =>
      _$RankingUnionElementFromJson(json);
}