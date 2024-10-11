import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_story_book/core/util/util.dart';

part 'item_equipment.freezed.dart';
part 'item_equipment.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : item_equipment.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 19..
/// Description      : 
///

@freezed
class ItemEquipment with _$ItemEquipment {
  const factory ItemEquipment({
    String? date,
    @JsonKey(name: 'character_gender') @Default('') String characterGender,
    @JsonKey(name: 'character_class') @Default('') String characterClass,
    @JsonKey(name: 'preset_no') @Default(0) int presetNo,
    @JsonKey(name: 'item_equipment') @Default([]) List<ItemEquipmentElement> itemEquipment,
    @JsonKey(name: 'item_equipment_preset_1') @Default([]) List<ItemEquipmentElement> itemEquipmentPreset1,
    @JsonKey(name: 'item_equipment_preset_2') @Default([]) List<ItemEquipmentElement> itemEquipmentPreset2,
    @JsonKey(name: 'item_equipment_preset_3') @Default([]) List<ItemEquipmentElement> itemEquipmentPreset3,
    Title? title,
    @JsonKey(name: 'dragon_equipment') @Default([]) List<DragonMechanicEquipment> dragonEquipment,
    @JsonKey(name: 'mechanic_equipment') @Default([]) List<DragonMechanicEquipment> mechanicEquipment,

  }) = _ItemEquipment;

  factory ItemEquipment.fromJson(Map<String, dynamic> json) => _$ItemEquipmentFromJson(json);

  static (
    String?,
    String,
    String,
    int,
    List<ItemEquipmentElement>,
    List<ItemEquipmentElement>,
    List<ItemEquipmentElement>,
    List<ItemEquipmentElement>,
    Title?,
    List<DragonMechanicEquipment>,
    List<DragonMechanicEquipment>,
  ) getItemEquipment(ItemEquipment itemEquipment) {
    return (
      itemEquipment.date,
      itemEquipment.characterGender,
      itemEquipment.characterClass,
      itemEquipment.presetNo,
      itemEquipment.itemEquipment,
      itemEquipment.itemEquipmentPreset1,
      itemEquipment.itemEquipmentPreset2,
      itemEquipment.itemEquipmentPreset3,
      itemEquipment.title,
      itemEquipment.dragonEquipment,
      itemEquipment.mechanicEquipment,
    );
  }
}

@freezed
class ItemEquipmentElement with _$ItemEquipmentElement {
  const factory ItemEquipmentElement({
    @JsonKey(name: 'item_equipment_part') @Default('') String itemEquipmentPart,
    @JsonKey(name: 'item_equipment_slot') @Default('') String itemEquipmentSlot,
    @JsonKey(name: 'item_name') @Default('') String itemName,
    @JsonKey(name: 'item_icon') @Default('') String itemIcon,
    @JsonKey(name: 'item_description') @Default('') String itemDescription,
    @JsonKey(name: 'item_shape_name') @Default('') String itemShapeName,
    @JsonKey(name: 'item_shape_icon') @Default('') String itemShapeIcon,
    @JsonKey(name: 'item_gender') @Default('') String itemGender,
    @JsonKey(name: 'item_total_option') ItemTotalOption? itemTotalOption,
    @JsonKey(name: 'item_base_option') ItemBaseOption? itemBaseOption,
    @JsonKey(name: 'potential_option_grade') @Default('') String potentialOptionGrade,
    @JsonKey(name: 'additional_potential_option_grade') @Default('') String additionalPotentialOptionGrade,
    @JsonKey(name: 'potential_option_flag', fromJson: stringToConvertBool) @Default(false) bool potentialOptionFlag,
    @JsonKey(name: 'potential_option_1') @Default('') String potentialOption1,
    @JsonKey(name: 'potential_option_2') @Default('') String potentialOption2,
    @JsonKey(name: 'potential_option_3') @Default('') String potentialOption3,
    @JsonKey(name: 'additional_potential_option_flag', fromJson: stringToConvertBool) @Default(false) bool additionalPotentialOptionFlag,
    @JsonKey(name: 'additional_potential_option_1') @Default('') String additionalPotentialOption1,
    @JsonKey(name: 'additional_potential_option_2') @Default('') String additionalPotentialOption2,
    @JsonKey(name: 'additional_potential_option_3') @Default('') String additionalPotentialOption3,
    @JsonKey(name: 'equipment_level_increase') @Default(0) int equipmentLevelIncrease,
    @JsonKey(name: 'item_exceptional_option') ItemExceptionalOption? itemExceptionalOption,
    @JsonKey(name: 'item_add_option') ItemAddOption? itemAddOption,
    @JsonKey(name: 'growth_exp') @Default(0) int growthExp,
    @JsonKey(name: 'growth_level') @Default(0) int growthLevel,
    @JsonKey(name: 'scroll_upgrade', fromJson: stringToConvertInt) @Default(0) int scrollUpgrade,
    @JsonKey(name: 'cuttable_count', fromJson: stringToConvertInt) @Default(0) int cuttableCount,
    @JsonKey(name: 'golden_hammer_flag') @Default('') String goldenHammerFlag,
    @JsonKey(name: 'scroll_resilience_count', fromJson: stringToConvertInt) @Default(0) int scrollResilienceCount,
    @JsonKey(name: 'scroll_upgradeable_count', fromJson: stringToConvertInt) @Default(0) int scrollUpgradeableCount,
    @JsonKey(name: 'soul_name') @Default('') String soulName,
    @JsonKey(name: 'soul_option') @Default('') String soulOption,
    @JsonKey(name: 'item_etc_option') ItemEtcOption? itemEtcOption,
    @JsonKey(fromJson: stringToConvertInt) @Default(0) int starforce,
    @JsonKey(name: 'starforce_scroll_flag') @Default('') String starforceScrollFlag,
    @JsonKey(name: 'item_starforce_option') ItemEtcOption? itemStarforceOption,
    @JsonKey(name: 'special_ring_level') @Default(0) int specialRingLevel,
    @JsonKey(name: 'date_expire') @Default('') String dateExpire,
  }) = _ItemEquipmentElement;

  factory ItemEquipmentElement.fromJson(Map<String, dynamic> json) => _$ItemEquipmentElementFromJson(json);

  static (
    String,
    String,
    String,
    String,
    String,
    String,
    String,
    String,
    ItemTotalOption?,
    ItemBaseOption?,
    String,
    String,
    bool,
    String,
    String,
    String,
    bool,
    String,
    String,
    String,
    int,
    ItemExceptionalOption?,
    ItemAddOption?,
    int,
    int,
    int,
    int,
    String,
    int,
    int,
    String,
    String,
    ItemEtcOption?,
    int,
    String,
    ItemEtcOption?,
    int,
    String,
  ) getItemEquipmentElement(ItemEquipmentElement itemEquipmentElement) {
    return (
      itemEquipmentElement.itemEquipmentPart,
      itemEquipmentElement.itemEquipmentSlot,
      itemEquipmentElement.itemName,
      itemEquipmentElement.itemIcon,
      itemEquipmentElement.itemDescription,
      itemEquipmentElement.itemShapeName,
      itemEquipmentElement.itemShapeIcon,
      itemEquipmentElement.itemGender,
      itemEquipmentElement.itemTotalOption,
      itemEquipmentElement.itemBaseOption,
      itemEquipmentElement.potentialOptionGrade,
      itemEquipmentElement.additionalPotentialOptionGrade,
      itemEquipmentElement.potentialOptionFlag,
      itemEquipmentElement.potentialOption1,
      itemEquipmentElement.potentialOption2,
      itemEquipmentElement.potentialOption3,
      itemEquipmentElement.additionalPotentialOptionFlag,
      itemEquipmentElement.additionalPotentialOption1,
      itemEquipmentElement.additionalPotentialOption2,
      itemEquipmentElement.additionalPotentialOption3,
      itemEquipmentElement.equipmentLevelIncrease,
      itemEquipmentElement.itemExceptionalOption,
      itemEquipmentElement.itemAddOption,
      itemEquipmentElement.growthExp,
      itemEquipmentElement.growthLevel,
      itemEquipmentElement.scrollUpgrade,
      itemEquipmentElement.cuttableCount,
      itemEquipmentElement.goldenHammerFlag,
      itemEquipmentElement.scrollResilienceCount,
      itemEquipmentElement.scrollUpgradeableCount,
      itemEquipmentElement.soulName,
      itemEquipmentElement.soulOption,
      itemEquipmentElement.itemEtcOption,
      itemEquipmentElement.starforce,
      itemEquipmentElement.starforceScrollFlag,
      itemEquipmentElement.itemStarforceOption,
      itemEquipmentElement.specialRingLevel,
      itemEquipmentElement.dateExpire,
    );
  }
}

@freezed
class ItemTotalOption with _$ItemTotalOption {
  const factory ItemTotalOption({
    @JsonKey(name: 'str', fromJson: stringToConvertInt) @Default(0) int strStat,
    @JsonKey(name: 'dex', fromJson: stringToConvertInt) @Default(0) int dexStat,
    @JsonKey(name: 'int', fromJson: stringToConvertInt) @Default(0) int intStat,
    @JsonKey(name: 'luk', fromJson: stringToConvertInt) @Default(0) int lukStat,
    @JsonKey(name: 'max_hp', fromJson: stringToConvertInt) @Default(0) int maxHp,
    @JsonKey(name: 'max_mp', fromJson: stringToConvertInt) @Default(0) int maxMp,
    @JsonKey(name: 'attack_power', fromJson: stringToConvertInt) @Default(0) int attackPower,
    @JsonKey(name: 'magic_power', fromJson: stringToConvertInt) @Default(0) int magicPower,
    @JsonKey(fromJson: stringToConvertInt) @Default(0) int armor,
    @JsonKey(fromJson: stringToConvertInt) @Default(0) int speed,
    @JsonKey(fromJson: stringToConvertInt) @Default(0) int jump,
    @JsonKey(name: 'boss_damage', fromJson: stringToConvertInt) @Default(0) int bossDamage,
    @JsonKey(name: 'ignore_monster_armor', fromJson: stringToConvertInt) @Default(0) int ignoreMonsterArmor,
    @JsonKey(name: 'all_stat', fromJson: stringToConvertInt) @Default(0) int allStat,
    @JsonKey(fromJson: stringToConvertInt) @Default(0) int damage,
    @JsonKey(name: 'equipment_level_decrease', fromJson: stringToConvertInt) @Default(0) int equipmentLevelDecrease,
    @JsonKey(name: 'max_hp_rate', fromJson: stringToConvertInt) @Default(0) int maxHpRate,
    @JsonKey(name: 'max_mp_rate', fromJson: stringToConvertInt) @Default(0) int maxMpRate,
  }) = _ItemTotalOption;

  factory ItemTotalOption.fromJson(Map<String, dynamic> json) => _$ItemTotalOptionFromJson(json);

  static (
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
  ) getItemTotalOption(ItemTotalOption itemTotalOption) {
    return (
      itemTotalOption.strStat,
      itemTotalOption.dexStat,
      itemTotalOption.intStat,
      itemTotalOption.lukStat,
      itemTotalOption.maxHp,
      itemTotalOption.maxMp,
      itemTotalOption.attackPower,
      itemTotalOption.magicPower,
      itemTotalOption.armor,
      itemTotalOption.speed,
      itemTotalOption.jump,
      itemTotalOption.bossDamage,
      itemTotalOption.ignoreMonsterArmor,
      itemTotalOption.allStat,
      itemTotalOption.damage,
      itemTotalOption.equipmentLevelDecrease,
      itemTotalOption.maxHpRate,
      itemTotalOption.maxMpRate,
    );
  }
}

@freezed
class ItemBaseOption with _$ItemBaseOption {
  const factory ItemBaseOption({
    @JsonKey(name: 'str', fromJson: stringToConvertInt) @Default(0) int strStat,
    @JsonKey(name: 'dex', fromJson: stringToConvertInt) @Default(0) int dexStat,
    @JsonKey(name: 'int', fromJson: stringToConvertInt) @Default(0) int intStat,
    @JsonKey(name: 'luk', fromJson: stringToConvertInt) @Default(0) int lukStat,
    @JsonKey(name: 'max_hp', fromJson: stringToConvertInt) @Default(0) int maxHp,
    @JsonKey(name: 'max_mp', fromJson: stringToConvertInt) @Default(0) int maxMp,
    @JsonKey(name: 'attack_power', fromJson: stringToConvertInt) @Default(0) int attackPower,
    @JsonKey(name: 'magic_power', fromJson: stringToConvertInt) @Default(0) int magicPower,
    @JsonKey(fromJson: stringToConvertInt) @Default(0) int armor,
    @JsonKey(fromJson: stringToConvertInt) @Default(0) int speed,
    @JsonKey(fromJson: stringToConvertInt) @Default(0) int jump,
    @JsonKey(name: 'boss_damage', fromJson: stringToConvertInt) @Default(0) int bossDamage,
    @JsonKey(name: 'ignore_monster_armor', fromJson: stringToConvertInt) @Default(0) int ignoreMonsterArmor,
    @JsonKey(name: 'all_stat', fromJson: stringToConvertInt) @Default(0) int allStat,
    @JsonKey(name: 'max_hp_rate', fromJson: stringToConvertInt) @Default(0) int maxHpRate,
    @JsonKey(name: 'max_mp_rate', fromJson: stringToConvertInt) @Default(0) int maxMpRate,
    @JsonKey(name: 'base_equipment_level', fromJson: stringToConvertInt) @Default(0) int baseEquipmentLevel,
  }) = _ItemBaseOption;

  factory ItemBaseOption.fromJson(Map<String, dynamic> json) => _$ItemBaseOptionFromJson(json);

  static (
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
  ) getItemBaseOption(ItemBaseOption itemBaseOption) {
    return (
      itemBaseOption.strStat,
      itemBaseOption.dexStat,
      itemBaseOption.intStat,
      itemBaseOption.lukStat,
      itemBaseOption.maxHp,
      itemBaseOption.maxMp,
      itemBaseOption.attackPower,
      itemBaseOption.magicPower,
      itemBaseOption.armor,
      itemBaseOption.speed,
      itemBaseOption.jump,
      itemBaseOption.bossDamage,
      itemBaseOption.ignoreMonsterArmor,
      itemBaseOption.allStat,
      itemBaseOption.maxHpRate,
      itemBaseOption.maxMpRate,
      itemBaseOption.baseEquipmentLevel,
    );
  }
}

@freezed
class ItemExceptionalOption with _$ItemExceptionalOption {
  const factory ItemExceptionalOption({
    @JsonKey(name: 'str', fromJson: stringToConvertInt) @Default(0) int strStat,
    @JsonKey(name: 'dex', fromJson: stringToConvertInt) @Default(0) int dexStat,
    @JsonKey(name: 'int', fromJson: stringToConvertInt) @Default(0) int intStat,
    @JsonKey(name: 'luk', fromJson: stringToConvertInt) @Default(0) int lukStat,
    @JsonKey(name: 'max_hp', fromJson: stringToConvertInt) @Default(0) int maxHp,
    @JsonKey(name: 'max_mp', fromJson: stringToConvertInt) @Default(0) int maxMp,
    @JsonKey(name: 'attack_power', fromJson: stringToConvertInt) @Default(0) int attackPower,
    @JsonKey(name: 'magic_power', fromJson: stringToConvertInt) @Default(0) int magicPower,
    @JsonKey(name: 'exceptional_upgrade') @Default(0) int exceptionalUpgrade,

  }) = _ItemExceptionalOption;

  factory ItemExceptionalOption.fromJson(Map<String, dynamic> json) => _$ItemExceptionalOptionFromJson(json);

  static (
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
  ) getItemExceptionalOption(ItemExceptionalOption itemExceptionalOption) {
    return (
      itemExceptionalOption.strStat,
      itemExceptionalOption.dexStat,
      itemExceptionalOption.intStat,
      itemExceptionalOption.lukStat,
      itemExceptionalOption.maxHp,
      itemExceptionalOption.maxMp,
      itemExceptionalOption.attackPower,
      itemExceptionalOption.magicPower,
      itemExceptionalOption.exceptionalUpgrade,
    );
  }
}

@freezed
class ItemAddOption with _$ItemAddOption {
  const factory ItemAddOption({
    @JsonKey(name: 'str', fromJson: stringToConvertInt) @Default(0) int strStat,
    @JsonKey(name: 'dex', fromJson: stringToConvertInt) @Default(0) int dexStat,
    @JsonKey(name: 'int', fromJson: stringToConvertInt) @Default(0) int intStat,
    @JsonKey(name: 'luk', fromJson: stringToConvertInt) @Default(0) int lukStat,
    @JsonKey(name: 'max_hp', fromJson: stringToConvertInt) @Default(0) int maxHp,
    @JsonKey(name: 'max_mp', fromJson: stringToConvertInt) @Default(0) int maxMp,
    @JsonKey(name: 'attack_power', fromJson: stringToConvertInt) @Default(0) int attackPower,
    @JsonKey(name: 'magic_power', fromJson: stringToConvertInt) @Default(0) int magicPower,
    @JsonKey(fromJson: stringToConvertInt) @Default(0) int armor,
    @JsonKey(fromJson: stringToConvertInt) @Default(0) int speed,
    @JsonKey(fromJson: stringToConvertInt) @Default(0) int jump,
    @JsonKey(name: 'boss_damage', fromJson: stringToConvertInt) @Default(0) int bossDamage,
    @JsonKey(fromJson: stringToConvertInt) @Default(0) int damage,
    @JsonKey(name: 'all_stat', fromJson: stringToConvertInt) @Default(0) int allStat,
    @JsonKey(name: 'equipment_level_decrease', fromJson: stringToConvertInt) @Default(0) int equipmentLevelDecrease,
  }) = _ItemAddOption;

  factory ItemAddOption.fromJson(Map<String, dynamic> json) => _$ItemAddOptionFromJson(json);

  static (
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
  ) getItemAddOption(ItemAddOption itemAddOption) {
    return (
      itemAddOption.strStat,
      itemAddOption.dexStat,
      itemAddOption.intStat,
      itemAddOption.lukStat,
      itemAddOption.maxHp,
      itemAddOption.maxMp,
      itemAddOption.attackPower,
      itemAddOption.magicPower,
      itemAddOption.armor,
      itemAddOption.speed,
      itemAddOption.jump,
      itemAddOption.bossDamage,
      itemAddOption.damage,
      itemAddOption.allStat,
      itemAddOption.equipmentLevelDecrease,
    );
  }
}

@freezed
class ItemEtcOption with _$ItemEtcOption {
  const factory ItemEtcOption({
    @JsonKey(name: 'str', fromJson: stringToConvertInt) @Default(0) int strStat,
    @JsonKey(name: 'dex', fromJson: stringToConvertInt) @Default(0) int dexStat,
    @JsonKey(name: 'int', fromJson: stringToConvertInt) @Default(0) int intStat,
    @JsonKey(name: 'luk', fromJson: stringToConvertInt) @Default(0) int lukStat,
    @JsonKey(name: 'max_hp', fromJson: stringToConvertInt) @Default(0) int maxHp,
    @JsonKey(name: 'max_mp', fromJson: stringToConvertInt) @Default(0) int maxMp,
    @JsonKey(name: 'attack_power', fromJson: stringToConvertInt) @Default(0) int attackPower,
    @JsonKey(name: 'magic_power', fromJson: stringToConvertInt) @Default(0) int magicPower,
    @JsonKey(fromJson: stringToConvertInt) @Default(0) int armor,
    @JsonKey(fromJson: stringToConvertInt) @Default(0) int speed,
    @JsonKey(fromJson: stringToConvertInt) @Default(0) int jump,
  }) = _ItemEtcOption;

  factory ItemEtcOption.fromJson(Map<String, dynamic> json) => _$ItemEtcOptionFromJson(json);

  static (
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
    int,
  ) getItemEtcOption(ItemEtcOption itemEtcOption) {
    return (
      itemEtcOption.strStat,
      itemEtcOption.dexStat,
      itemEtcOption.intStat,
      itemEtcOption.lukStat,
      itemEtcOption.maxHp,
      itemEtcOption.maxMp,
      itemEtcOption.attackPower,
      itemEtcOption.magicPower,
      itemEtcOption.armor,
      itemEtcOption.speed,
      itemEtcOption.jump,
    );
  }
}

@freezed
class Title with _$Title {
  const factory Title({
    @JsonKey(name: 'title_name') @Default('') String titleName,
    @JsonKey(name: 'title_icon') @Default('') String titleIcon,
    @JsonKey(name: 'title_description') @Default('') String titleDescription,
    @JsonKey(name: 'date_expire') @Default('') String dateExpire,
    @JsonKey(name: 'date_option_expire') @Default('') String dateOptionExpire,

  }) = _Title;

  factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);

  static (
    String,
    String,
    String,
    String,
    String,
  ) getTitle(Title title) {
    return (
      title.titleName,
      title.titleIcon,
      title.titleDescription,
      title.dateExpire,
      title.dateOptionExpire,
    );
  }
}

@freezed
class DragonMechanicEquipment with _$DragonMechanicEquipment {
  const factory DragonMechanicEquipment({
    @JsonKey(name: 'item_equipment_part') @Default('') String itemEquipmentPart,
    @JsonKey(name: 'item_equipment_slot') @Default('') String itemEquipmentSlot,
    @JsonKey(name: 'item_name') @Default('') String itemName,
    @JsonKey(name: 'item_icon') @Default('') String itemIcon,
    @JsonKey(name: 'item_description') @Default('') String itemDescription,
    @JsonKey(name: 'item_shape_name') @Default('') String itemShapeName,
    @JsonKey(name: 'item_shape_icon') @Default('') String itemShapeIcon,
    @JsonKey(name: 'item_gender') @Default('') String itemGender,
    @JsonKey(name: 'item_total_option') ItemTotalOption? itemTotalOption,
    @JsonKey(name: 'item_base_option') ItemBaseOption? itemBaseOption,
    @JsonKey(name: 'equipment_level_increase') @Default(0) int equipmentLevelIncrease,
    @JsonKey(name: 'item_exceptional_option') ItemExceptionalOption? itemExceptionalOption,
    @JsonKey(name: 'item_add_option') ItemAddOption? itemAddOption,
    @JsonKey(name: 'growth_exp') @Default(0) int growthExp,
    @JsonKey(name: 'growth_level') @Default(0) int growthLevel,
    @JsonKey(name: 'scroll_upgrade', fromJson: stringToConvertInt) @Default(0) int scrollUpgrade,
    @JsonKey(name: 'cuttable_count', fromJson: stringToConvertInt) @Default(0) int cuttableCount,
    @JsonKey(name: 'golden_hammer_flag') @Default('') String goldenHammerFlag,
    @JsonKey(name: 'scroll_resilience_count', fromJson: stringToConvertInt) @Default(0) int scrollResilienceCount,
    @JsonKey(name: 'scroll_upgradeable_count', fromJson: stringToConvertInt) @Default(0) int scrollUpgradeableCount,
    @JsonKey(name: 'soul_name') @Default('') String soulName,
    @JsonKey(name: 'soul_option') @Default('') String soulOption,
    @JsonKey(name: 'item_etc_option') ItemEtcOption? itemEtcOption,
    @JsonKey(fromJson: stringToConvertInt) @Default(0) int starforce,
    @JsonKey(name: 'starforce_scroll_flag') @Default('') String starforceScrollFlag,
    @JsonKey(name: 'item_starforce_option') ItemEtcOption? itemStarforceOption,
    @JsonKey(name: 'special_ring_level') @Default(0) int specialRingLevel,
    @JsonKey(name: 'date_expire') @Default('') String dateExpire,
  }) = _DragonMechanicEquipment;

  factory DragonMechanicEquipment.fromJson(Map<String, dynamic> json) => _$DragonMechanicEquipmentFromJson(json);

  static (
    String,
    String,
    String,
    String,
    String,
    String,
    String,
    String,
    ItemTotalOption?,
    ItemBaseOption?,
    int,
    ItemExceptionalOption?,
    ItemAddOption?,
    int,
    int,
    int,
    int,
    String,
    int,
    int,
    String,
    String,
    ItemEtcOption?,
    int,
    String,
    ItemEtcOption?,
    int,
    String,
  ) getDragonMechanicEquipment(DragonMechanicEquipment dragonMechanicEquipment) {
    return (
      dragonMechanicEquipment.itemEquipmentPart,
      dragonMechanicEquipment.itemEquipmentSlot,
      dragonMechanicEquipment.itemName,
      dragonMechanicEquipment.itemIcon,
      dragonMechanicEquipment.itemDescription,
      dragonMechanicEquipment.itemShapeName,
      dragonMechanicEquipment.itemShapeIcon,
      dragonMechanicEquipment.itemGender,
      dragonMechanicEquipment.itemTotalOption,
      dragonMechanicEquipment.itemBaseOption,
      dragonMechanicEquipment.equipmentLevelIncrease,
      dragonMechanicEquipment.itemExceptionalOption,
      dragonMechanicEquipment.itemAddOption,
      dragonMechanicEquipment.growthExp,
      dragonMechanicEquipment.growthLevel,
      dragonMechanicEquipment.scrollUpgrade,
      dragonMechanicEquipment.cuttableCount,
      dragonMechanicEquipment.goldenHammerFlag,
      dragonMechanicEquipment.scrollResilienceCount,
      dragonMechanicEquipment.scrollUpgradeableCount,
      dragonMechanicEquipment.soulName,
      dragonMechanicEquipment.soulOption,
      dragonMechanicEquipment.itemEtcOption,
      dragonMechanicEquipment.starforce,
      dragonMechanicEquipment.starforceScrollFlag,
      dragonMechanicEquipment.itemStarforceOption,
      dragonMechanicEquipment.specialRingLevel,
      dragonMechanicEquipment.dateExpire,
    );
  }
}