import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_story_book/core/util/util.dart';

import 'cash_item_equipment.dart';

part 'android_equipment.freezed.dart';
part 'android_equipment.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : android_equipment.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 19..
/// Description      :
///

@freezed
class AndroidEquipment with _$AndroidEquipment {
  const factory AndroidEquipment({
    String? date,
    @JsonKey(name: 'android_name') @Default('') String androidName,
    @JsonKey(name: 'android_nickname') @Default('') String androidNickname,
    @JsonKey(name: 'android_icon') @Default('') String androidIcon,
    @JsonKey(name: 'android_description') @Default('') String androidDescription,
    @JsonKey(name: 'android_hair') AndroidHairElement? androidHair,
    @JsonKey(name: 'android_face') AndroidFaceElement?  androidFace,
    @JsonKey(name: 'android_skin') AndroidSkinElement? androidSkin,
    @JsonKey(name: 'android_cash_item_equipment') @Default([]) List<CashItemEquipmentElement> androidCashItemEquipment,
    @JsonKey(name: 'android_ear_sensor_clip_flag') @Default('') String androidEarSensorClipFlag,
    @JsonKey(name: 'android_gender') @Default('') String androidGender,
    @JsonKey(name: 'android_grade') @Default('') String androidGrade,
    @JsonKey(name: 'android_non_humanoid_flag') @Default('') String androidNonHumanoidFlag,
    @JsonKey(name: 'android_shop_usable_flag') @Default('') String androidShopUsableFlag,
    @JsonKey(name: 'preset_no') @Default(0) int presetNo,
    @JsonKey(name: 'android_preset_1') AndroidPresetElement? androidPresetFirst,
    @JsonKey(name: 'android_preset_2') AndroidPresetElement?  androidPresetSecond,
    @JsonKey(name: 'android_preset_3') AndroidPresetElement?  androidPresetThird,
  }) = _AndroidEquipment;

  factory AndroidEquipment.fromJson(Map<String, dynamic> json) =>
      _$AndroidEquipmentFromJson(json);
}

@freezed
class AndroidHairElement with _$AndroidHairElement {
  const factory AndroidHairElement({
    @JsonKey(name: 'hair_name') @Default('') String hairName,
    @JsonKey(name: 'base_color') @Default('') String baseColor,
    @JsonKey(name: 'mix_color') @Default('') String mixColor,
    @JsonKey(name: 'mix_rate') @Default('') String mixRate,
  }) = _AndroidHairElement;

  factory AndroidHairElement.fromJson(Map<String, dynamic> json) =>
      _$AndroidHairElementFromJson(json);
}

@freezed
class AndroidFaceElement with _$AndroidFaceElement {
  const factory AndroidFaceElement({
    @JsonKey(name: 'face_name') @Default('') String faceName,
    @JsonKey(name: 'base_color') @Default('') String baseColor,
    @JsonKey(name: 'mix_color') @Default('') String mixColor,
    @JsonKey(name: 'mix_rate') @Default('') String mixRate,
  }) = _AndroidFaceElement;

  factory AndroidFaceElement.fromJson(Map<String, dynamic> json) =>
      _$AndroidFaceElementFromJson(json);
}

@freezed
class AndroidSkinElement with _$AndroidSkinElement {
  const factory AndroidSkinElement({
    @JsonKey(name: 'skin_name') @Default('') String skinName,
    @JsonKey(name: 'color_style') @Default('') String colorStyle,
    @JsonKey(name: 'hue') @Default(0) int hue,
    @JsonKey(name: 'saturation') @Default(0) int saturation,
    @JsonKey(name: 'brightness') @Default(0) int brightness,
  }) = _AndroidSkinElement;

  factory AndroidSkinElement.fromJson(Map<String, dynamic> json) =>
      _$AndroidSkinElementFromJson(json);
}


@freezed
class CashItemEquipmentElement with _$CashItemEquipmentElement {
  const factory CashItemEquipmentElement({
    @JsonKey(name: 'cash_item_equipment_part') @Default('') String cashItemEquipmentPart,
    @JsonKey(name: 'cash_item_equipment_slot') @Default('') String cashItemEquipmentSlot,
    @JsonKey(name: 'cash_item_name') @Default('') String cashItemName,
    @JsonKey(name: 'cash_item_icon') @Default('') String cashItemIcon,
    @JsonKey(name: 'cash_item_description') @Default('') String cashItemDescription,
    @JsonKey(name: 'cash_item_option') @Default([]) List<CashItemOptionElement> cashItemOption,
    @JsonKey(name: 'date_expire') @Default('') String dateExpire,
    @JsonKey(name: 'date_option_expire') @Default('') String dateOptionExpire,
    @JsonKey(name: 'cash_item_label') @Default('') String cashItemLabel,
    @JsonKey(name: 'cash_item_coloring_prism') CashItemColoringPrismElement? cashItemColoringPrism,
    @JsonKey(name: 'android_item_gender') @Default('') String androidItemGender,
  }) = _CashItemEquipmentElement;

  factory CashItemEquipmentElement.fromJson(Map<String, dynamic> json) =>
      _$CashItemEquipmentElementFromJson(json);
}

@freezed
class AndroidPresetElement with _$AndroidPresetElement {
  const factory AndroidPresetElement({
    @JsonKey(name: 'android_name') @Default('') String androidName,
    @JsonKey(name: 'android_nickname') @Default('') String androidNickname,
    @JsonKey(name: 'android_icon') @Default('') String androidIcon,
    @JsonKey(name: 'android_description') @Default('') String androidDescription,
    @JsonKey(name: 'android_gender') @Default('') String androidGender,
    @JsonKey(name: 'android_grade') @Default('') String androidGrade,
    @JsonKey(name: 'android_skin') AndroidSkinElement? androidSkin,
    @JsonKey(name: 'android_hair') AndroidHairElement? androidHair,
    @JsonKey(name: 'android_face') AndroidFaceElement? androidFace,
    @JsonKey(name: 'android_ear_sensor_clip_flag') @Default('') String androidEarSensorClipFlag,
    @JsonKey(name: 'android_non_humanoid_flag') @Default('') String androidNonHumanoidFlag,
    @JsonKey(name: 'android_shop_usable_flag') @Default('') String androidShopUsableFlag,
  }) = _AndroidPresetElement;

  factory AndroidPresetElement.fromJson(Map<String, dynamic> json) =>
      _$AndroidPresetElementFromJson(json);
}