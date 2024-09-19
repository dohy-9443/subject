import 'package:freezed_annotation/freezed_annotation.dart';

part 'guild_basic_info.freezed.dart';

part 'guild_basic_info.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : guild_basic_info.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 19..
/// Description      :
///

@freezed
class GuildBasicInfo with _$GuildBasicInfo {
  const factory GuildBasicInfo({
    String? date,
    @JsonKey(name: 'world_name') @Default('') String worldName,
    @JsonKey(name: 'guild_name') @Default('') String guildName,
    @JsonKey(name: 'guild_level') @Default(0) int guildLevel,
    @JsonKey(name: 'guild_fame') @Default(0) int guildFame,
    @JsonKey(name: 'guild_point') @Default(0) int guildPoint,
    @JsonKey(name: 'guild_master_name') @Default('') String guildMasterName,
    @JsonKey(name: 'guild_member_count') @Default(0) int guildMemberCount,
    @JsonKey(name: 'guild_member') @Default([]) List<String> guildMember,
    @JsonKey(name: 'guild_skill') @Default([]) List<SkillElement> guildSkill,
    @JsonKey(name: 'guild_noblesse_skill') @Default([]) List<SkillElement> guildNoblesseSkill,
  }) = _GuildBasicInfo;

  factory GuildBasicInfo.fromJson(Map<String, dynamic> json) =>
      _$GuildBasicInfoFromJson(json);
}

@freezed
class SkillElement with _$SkillElement {
  const factory SkillElement({
    String? date,
    @JsonKey(name: 'skill_name') @Default('') String skillName,
    @JsonKey(name: 'skill_description') @Default('') String skillDescription,
    @JsonKey(name: 'skill_level') @Default(0) int skillLevel,
    @JsonKey(name: 'skill_effect') @Default('') String skillEffect,
    @JsonKey(name: 'skill_icon') @Default('') String skillIcon,
  }) = _SkillElement;

  factory SkillElement.fromJson(Map<String, dynamic> json) =>
      _$SkillElementFromJson(json);
}