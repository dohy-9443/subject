import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_story_book/core/util/json.dart';

part 'cash_item_equipment.freezed.dart';
part 'cash_item_equipment.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : cash_item_equipment.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 20..
/// Description      : 
///

@freezed
class CashItemEquipment with _$CashItemEquipment {
  const factory CashItemEquipment({
    String? date,
    @JsonKey(name: 'character_gender') @Default('') String characterGender,
    @JsonKey(name: 'character_class') @Default('') String characterClass,
    @JsonKey(name: 'character_look_mode') @Default('') String characterLookMode,
    @JsonKey(name: 'preset_no') @Default(0) int presetNo,
    @JsonKey(name: 'cash_item_equipment_base') @Default([]) List<CashItemEquipmentBase> cashItemEquipmentBase
  }) = _CashItemEquipment;

  factory CashItemEquipment.fromJson(Map<String, dynamic> json) => _$CashItemEquipmentFromJson(json);
}

@freezed
class CashItemEquipmentBase with _$CashItemEquipmentBase {
  const factory CashItemEquipmentBase({
    @JsonKey(name: 'cash_item_equipment_part') @Default('') String cashItemEquipmentPart,
    @JsonKey(name: 'cash_item_equipment_slot') @Default('') String cashItemEquipmentSlot,
    @JsonKey(name: 'cash_item_name') @Default('') String cashItemName,
    @JsonKey(name: 'cash_item_icon') @Default('') String cashItemIcon,
    @JsonKey(name: 'cash_item_description') @Default('') String cashItemDescription,
    @JsonKey(name: 'cash_item_option') @Default([]) List<CashItemOptionElement> cashItemOption,
    @JsonKey(name: 'date_expire') @Default('') String dateExpire,
    @JsonKey(name: 'date_option_expire') @Default('') String dateOptionExpire,
    @JsonKey(name: 'cash_item_label') @Default('') String cashItemLabel,
    @JsonKey(name: 'cash_item_coloring_prism') @Default([]) List<CashItemColoringPrismElement> cashItemColoringPrism,
    @JsonKey(name: 'item_gender') @Default('') String itemGender,

  }) = _CashItemEquipmentBase;

  factory CashItemEquipmentBase.fromJson(Map<String, dynamic> json) => _$CashItemEquipmentBaseFromJson(json);
}

@freezed
class CashItemOptionElement with _$CashItemOptionElement {
  const factory CashItemOptionElement({
    @JsonKey(name: 'option_type') @Default('') String optionType,
    @JsonKey(name: 'option_value', fromJson: stringToConvertInt) @Default(0) int optionValue,
  }) = _CashItemOptionElement;

  factory CashItemOptionElement.fromJson(Map<String, dynamic> json) => _$CashItemOptionElementFromJson(json);
}

@freezed
class CashItemColoringPrismElement with _$CashItemColoringPrismElement {
  const factory CashItemColoringPrismElement({
    @JsonKey(name: 'color_range') @Default('') String colorRange,
    @Default(0) int hue,
    @Default(0) int saturation,
    @Default(0) int value,
  }) = _CashItemColoringPrismElement;

  factory CashItemColoringPrismElement.fromJson(Map<String, dynamic> json) => _$CashItemColoringPrismElementFromJson(json);
}