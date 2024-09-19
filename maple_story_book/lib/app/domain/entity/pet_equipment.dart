import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_story_book/core/util/util.dart';

part 'pet_equipment.freezed.dart';
part 'pet_equipment.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : pet_equipment.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 19..
/// Description      :
///

@freezed
class PetEquipment with _$PetEquipment {
  const factory PetEquipment({
    String? date,
    @JsonKey(name: 'pet_1_name') @Default('') String petFirstName,
    @JsonKey(name: 'pet_1_nickname') @Default('') String petFirstNickname,
    @JsonKey(name: 'pet_1_icon') @Default('') String petFirstIcon,
    @JsonKey(name: 'pet_1_description') @Default('') String petFirstDescription,
    @JsonKey(name: 'pet_1_equipment') required PetEquipmentElement petFirstEquipment,
    @JsonKey(name: 'pet_1_auto_skill') required AutoSkillElement petFirstAutoSkill,
    @JsonKey(name: 'pet_1_pet_type') @Default('') String petFirstPetType,
    @JsonKey(name: 'pet_1_skill') @Default('') List<String> petFirstSkill,
    @JsonKey(name: 'pet_1_date_expire') @Default('') String petFirstDateExpire,
    @JsonKey(name: 'pet_1_appearance') @Default('') String petFirstAppearance,
    @JsonKey(name: 'pet_1_appearance_icon') @Default('') String petFirstAppearanceIcon,
    @JsonKey(name: 'pet_2_name') @Default('') String petSecondName,
    @JsonKey(name: 'pet_2_nickname') @Default('') String petSecondNickname,
    @JsonKey(name: 'pet_2_icon') @Default('') String petSecondIcon,
    @JsonKey(name: 'pet_2_description') @Default('') String petSecondDescription,
    @JsonKey(name: 'pet_2_equipment') required PetEquipmentElement petSecondEquipment,
    @JsonKey(name: 'pet_2_auto_skill') required AutoSkillElement petSecondAutoSkill,
    @JsonKey(name: 'pet_2_pet_type') @Default('') String petSecondPetType,
    @JsonKey(name: 'pet_2_skill') @Default('') List<String> petSecondSkill,
    @JsonKey(name: 'pet_2_date_expire') @Default('') String petSecondDateExpire,
    @JsonKey(name: 'pet_2_appearance') @Default('') String petSecondAppearance,
    @JsonKey(name: 'pet_2_appearance_icon') @Default('') String petSecondAppearanceIcon,
    @JsonKey(name: 'pet_3_name') @Default('') String petThirdName,
    @JsonKey(name: 'pet_3_nickname') @Default('') String petThirdNickname,
    @JsonKey(name: 'pet_3_icon') @Default('') String petThirdIcon,
    @JsonKey(name: 'pet_3_description') @Default('') String petThirdDescription,
    @JsonKey(name: 'pet_3_equipment') required PetEquipmentElement petThirdEquipment,
    @JsonKey(name: 'pet_3_auto_skill') required AutoSkillElement petThirdAutoSkill,
    @JsonKey(name: 'pet_3_pet_type') @Default('') String petThirdPetType,
    @JsonKey(name: 'pet_3_skill') @Default([]) List<String> petThirdSkill,
    @JsonKey(name: 'pet_3_date_expire') @Default('') String petThirdDateExpire,
    @JsonKey(name: 'pet_3_appearance') @Default('') String petThirdAppearance,
    @JsonKey(name: 'pet_3_appearance_icon') @Default('') String petThirdAppearanceIcon,
  }) = _PetEquipment;

  factory PetEquipment.fromJson(Map<String, dynamic> json) =>
      _$PetEquipmentFromJson(json);
}

@freezed
class PetEquipmentElement with _$PetEquipmentElement {
  const factory PetEquipmentElement({
    @JsonKey(name: 'item_name') @Default('') String itemName,
    @JsonKey(name: 'item_icon') @Default('') String itemIcon,
    @JsonKey(name: 'item_description') @Default('') String itemDescription,
    @JsonKey(name: 'item_option') @Default([]) List<ItemOptionElement> itemOption,
    @JsonKey(name: 'scroll_upgrade') @Default(0) String scrollUpgrade,
    @JsonKey(name: 'scroll_upgradable') @Default(0) String scrollUpgradable,
    @JsonKey(name: 'item_shape') @Default('') String itemShape,
    @JsonKey(name: 'item_shape_icon') @Default('') String itemShapeIcon,
  }) = _PetEquipmentElement;

  factory PetEquipmentElement.fromJson(Map<String, dynamic> json) =>
      _$PetEquipmentElementFromJson(json);
}

@freezed
class ItemOptionElement with _$ItemOptionElement {
  const factory ItemOptionElement({
    @JsonKey(name: 'option_type') @Default('') String optionType,
    @JsonKey(name: 'option_value') @Default('') String optionValue,
  }) = _ItemOptionElement;

  factory ItemOptionElement.fromJson(Map<String, dynamic> json) =>
      _$ItemOptionElementFromJson(json);
}

@freezed
class AutoSkillElement with _$AutoSkillElement {
  const factory AutoSkillElement({
    @JsonKey(name: 'skill_1') @Default('') String skillFirst,
    @JsonKey(name: 'skill_1_icon') @Default('') String skillFirstIcon,
    @JsonKey(name: 'skill_2') @Default('') String skillSecond,
    @JsonKey(name: 'skill_2_icon') @Default('') String skillSecondIcon,
  }) = _AutoSkillElement;

  factory AutoSkillElement.fromJson(Map<String, dynamic> json) =>
      _$AutoSkillElementFromJson(json);
}
