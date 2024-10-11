import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_story_book/core/util/util.dart';

part 'basic_info.freezed.dart';
part 'basic_info.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : basic_info.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 18..
/// Description      : 
///

@freezed
class BasicInfo with _$BasicInfo {
  const factory BasicInfo({
    String? date,
    @JsonKey(name: 'character_name') @Default('') String characterName,
    @JsonKey(name: 'world_name') @Default('') String worldName,
    @JsonKey(name: 'character_gender') @Default('') String characterGender,
    @JsonKey(name: 'character_class') @Default('') String characterClass,
    @JsonKey(name: 'character_class_level') @Default('') String characterClassLevel,
    @JsonKey(name: 'character_level') @Default(0) int characterLevel,
    @JsonKey(name: 'characterExp') @Default(0) int characterExp,
    @JsonKey(name: 'character_exp_rate') @Default('') String characterExpRate,
    @JsonKey(name: 'character_guild_name') @Default('') String characterGuildName,
    @JsonKey(name: 'character_image') @Default('') String characterImage,
    @JsonKey(name: 'character_date_create') @Default('') String characterDateCreate,
    @JsonKey(name: 'access_flag', fromJson: stringToConvertBool) @Default(false) bool accessFlag,
    @JsonKey(name: 'liberation_quest_clear_flag', fromJson: stringToConvertBool) @Default(false) bool liberationQuestClearFlag,

  }) = _BasicInfo;

  factory BasicInfo.fromJson(Map<String, dynamic> json) => _$BasicInfoFromJson(json);

  static (String?, String, String, String, String, String, int, int, String, String, String, String, bool, bool) getCharacterInfo(BasicInfo basicInfo) {
    return (
      basicInfo.date,
      basicInfo.characterName,
      basicInfo.worldName,
      basicInfo.characterGender,
      basicInfo.characterClass,
      basicInfo.characterClassLevel,
      basicInfo.characterLevel,
      basicInfo.characterExp,
      basicInfo.characterExpRate,
      basicInfo.characterGuildName,
      basicInfo.characterImage,
      basicInfo.characterDateCreate,
      basicInfo.accessFlag,
      basicInfo.liberationQuestClearFlag,
    );
  }
}