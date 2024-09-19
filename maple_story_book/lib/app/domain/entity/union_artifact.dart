import 'package:freezed_annotation/freezed_annotation.dart';

part 'union_artifact.freezed.dart';
part 'union_artifact.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : union_artifact.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 19..
/// Description      :
///

@freezed
class UnionArtifact with _$UnionArtifact {
  const factory UnionArtifact({
    @Default('') String date,
    @JsonKey(name: 'union_artifact_effect') @Default([]) List<UnionArtifactEffectElement> unionArtifactEffect,
    @JsonKey(name: 'union_artifact_crystal') @Default([]) List<UnionArtifactCrystalElement> unionArtifactCrystal,
    @JsonKey(name: 'union_artifact_remain_ap') @Default(0) int unionArtifactRemainAp,

  }) = _UnionArtifact;

  factory UnionArtifact.fromJson(Map<String, dynamic> json) =>
      _$UnionArtifactFromJson(json);
}

@freezed
class UnionArtifactEffectElement with _$UnionArtifactEffectElement {
  const factory UnionArtifactEffectElement({
    @Default('') String name,
    @Default(0) int level,
  }) = _UnionArtifactEffectElement;

  factory UnionArtifactEffectElement.fromJson(Map<String, dynamic> json) =>
      _$UnionArtifactEffectElementFromJson(json);
}

@freezed
class UnionArtifactCrystalElement with _$UnionArtifactCrystalElement {
  const factory UnionArtifactCrystalElement({
    @JsonKey(name: '') @Default('') String name,
    @JsonKey(name: 'validity_flag') @Default('') String validityFlag,
    @JsonKey(name: 'date_expire') @Default('') String dateExpire,
    @Default(0) int level,
    @JsonKey(name: 'crystal_option_name_1') @Default('') String crystalOptionNameFirst,
    @JsonKey(name: 'crystal_option_name_2') @Default('') String crystalOptionNameSecond,
    @JsonKey(name: 'crystal_option_name_3') @Default('') String crystalOptionNameThird,
  }) = _UnionArtifactCrystalElement;

  factory UnionArtifactCrystalElement.fromJson(Map<String, dynamic> json) =>
      _$UnionArtifactCrystalElementFromJson(json);
}