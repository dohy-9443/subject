import 'package:freezed_annotation/freezed_annotation.dart';

part 'union_info.freezed.dart';
part 'union_info.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : union_info.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 19..
/// Description      :
///

@freezed
class UnionInfo with _$UnionInfo {
  const factory UnionInfo({
    @Default('') String date,
    @JsonKey(name: 'union_level') @Default(0) int unionLevel,
    @JsonKey(name: 'union_grade') @Default('') String unionGrade,
    @JsonKey(name: 'union_artifact_level') @Default(0) int unionArtifactLevel,
    @JsonKey(name: 'union_artifact_exp') @Default(0) int unionArtifactExp,
    @JsonKey(name: 'union_artifact_point') @Default(0) int unionArtifactPoint,
  }) = _UnionInfo;

  factory UnionInfo.fromJson(Map<String, dynamic> json) =>
      _$UnionInfoFromJson(json);
}