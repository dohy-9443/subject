import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_story_book/core/util/util.dart';

part 'beauty_equipment.freezed.dart';
part 'beauty_equipment.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : beauty_equipment.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 20..
/// Description      : 
///

@freezed
class BeautyEquipment with _$BeautyEquipment {
  const factory BeautyEquipment({
    String? date,
    @JsonKey(name: 'character_gender') @Default('') String characterGender,
    @JsonKey(name: 'character_class') @Default('') String characterClass,
    @JsonKey(name: 'character_hair') CharacterHair? characterHair,
    @JsonKey(name: 'character_face') CharacterFace? characterFace,
    @JsonKey(name: 'character_skin') CharacterSkin? characterSkin,
    @JsonKey(name: 'additional_character_hair') CharacterHair? additionalCharacterHair,
    @JsonKey(name: 'additional_character_face') CharacterFace? additionalCharacterFace,
    @JsonKey(name: 'additional_character_skin') CharacterSkin? additionalCharacterSkin,
  }) = _BeautyEquipment;

  factory BeautyEquipment.fromJson(Map<String, dynamic> json) => _$BeautyEquipmentFromJson(json);
}

@freezed
class CharacterHair with _$CharacterHair {
  const factory CharacterHair({
    @JsonKey(name: 'hair_name') @Default('') String hairName,
    @JsonKey(name: 'base_color') @Default('') String baseColor,
    @JsonKey(name: 'mix_color') @Default('') String mixColor,
    @JsonKey(name: 'mix_rate', fromJson: stringToConvertInt) @Default(0) int mixRate,
  }) = _CharacterHair;

  factory CharacterHair.fromJson(Map<String, dynamic> json) => _$CharacterHairFromJson(json);
}

@freezed
class CharacterFace with _$CharacterFace {
  const factory CharacterFace({
    @JsonKey(name: 'face_name') @Default('') String faceName,
    @JsonKey(name: 'base_color') @Default('') String baseColor,
    @JsonKey(name: 'mix_color') @Default('') String mixColor,
    @JsonKey(name: 'mix_rate', fromJson: stringToConvertInt) @Default(0) int mixRate,
  }) = _CharacterFace;

  factory CharacterFace.fromJson(Map<String, dynamic> json) => _$CharacterFaceFromJson(json);
}

@freezed
class CharacterSkin with _$CharacterSkin {
  const factory CharacterSkin({
    @JsonKey(name: 'skin_name') @Default('') String hairName,
    @JsonKey(name: 'color_style') @Default('') String baseColor,
    @Default(0) int mixColor,
    @Default(0) int saturation,
    @Default(0) int brightness,
  }) = _CharacterSkin;

  factory CharacterSkin.fromJson(Map<String, dynamic> json) => _$CharacterSkinFromJson(json);
}