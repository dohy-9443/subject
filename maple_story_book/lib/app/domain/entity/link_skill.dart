import 'package:freezed_annotation/freezed_annotation.dart';

part 'link_skill.freezed.dart';
part 'link_skill.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : link_skill.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 19..
/// Description      :
///

@freezed
class LinkSkill with _$LinkSkill {
  const factory LinkSkill({
    String? date,
    @JsonKey(name: 'character_class') @Default('') String characterClass,
    @JsonKey(name: 'character_link_skill') LinkSkillElement? characterLinkSkill,
    @JsonKey(name: 'character_link_skill_preset_1') @Default('') String characterLinkSkillPresetFirst,
    @JsonKey(name: 'character_link_skill_preset_2') @Default('') String characterLinkSkillPresetSecond,
    @JsonKey(name: 'character_link_skill_preset_3') @Default('') String characterLinkSkillPresetThird,
    @JsonKey(name: 'character_owned_link_skill') LinkSkillPresetElement? characterOwnedLinkSkill,
    @JsonKey(name: 'character_owned_link_skill_preset_1') LinkSkillPresetElement? characterOwnedLinkSkillPresetFirst,
    @JsonKey(name: 'character_owned_link_skill_preset_2') LinkSkillPresetElement? characterOwnedLinkSkillPresetSecond,
    @JsonKey(name: 'character_owned_link_skill_preset_3') LinkSkillPresetElement? characterOwnedLinkSkillPresetThird,
  }) = _LinkSkill;

  factory LinkSkill.fromJson(Map<String, dynamic> json) =>
      _$LinkSkillFromJson(json);
}

@freezed
class LinkSkillElement with _$LinkSkillElement {
  const factory LinkSkillElement({
    @JsonKey(name: 'skill_name') @Default('') String skillName,
    @JsonKey(name: 'skill_description') @Default('') String skillDescription,
    @JsonKey(name: 'skill_level') @Default(0) int skillLevel,
    @JsonKey(name: 'skill_effect') @Default('') String skillEffect,
    @JsonKey(name: 'skill_effect_next') @Default('') String skillEffectNext,
    @JsonKey(name: 'skill_icon') @Default('') String skillIcon,
  }) = _LinkSkillElement;

  factory LinkSkillElement.fromJson(Map<String, dynamic> json) =>
      _$LinkSkillElementFromJson(json);
}

@freezed
class LinkSkillPresetElement with _$LinkSkillPresetElement {
  const factory LinkSkillPresetElement({
    @JsonKey(name: 'skill_name') @Default('') String skillName,
    @JsonKey(name: 'skill_description') @Default('') String skillDescription,
    @JsonKey(name: 'skill_level') @Default(0) int skillLevel,
    @JsonKey(name: 'skill_effect') @Default('') String skillEffect,
    @JsonKey(name: 'skill_icon') @Default('') String skillIcon,
  }) = _LinkSkillPresetElement;

  factory LinkSkillPresetElement.fromJson(Map<String, dynamic> json) =>
      _$LinkSkillPresetElementFromJson(json);
}
