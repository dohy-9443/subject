import 'package:freezed_annotation/freezed_annotation.dart';

import 'link_skill.dart';

part 'skill_info.freezed.dart';
part 'skill_info.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : skill_info.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 19..
/// Description      :
///

@freezed
class SkillInfo with _$SkillInfo {
  const factory SkillInfo({
    String? date,
    @JsonKey(name: 'character_class') @Default('') String characterClass,
    @JsonKey(name: 'character_skill_grade') @Default('') String characterSkillGrade,
    @JsonKey(name: 'character_skill') @Default([]) List<LinkSkillElement> characterSkill,
  }) = _SkillInfo;

  factory SkillInfo.fromJson(Map<String, dynamic> json) =>
      _$SkillInfoFromJson(json);
}

