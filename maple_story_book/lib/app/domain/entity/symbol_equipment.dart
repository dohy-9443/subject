import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_story_book/core/util/json.dart';

part 'symbol_equipment.freezed.dart';
part 'symbol_equipment.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : symbol_equipment.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 20..
/// Description      : 
///

@freezed
class SymbolEquipment with _$SymbolEquipment {
  const factory SymbolEquipment({
    String? date,
    @JsonKey(name: 'character_class') @Default('') String characterClass,
    @Default([]) List<Symbol> symbol,
  }) = _SymbolEquipment;

  factory SymbolEquipment.fromJson(Map<String, dynamic> json) => _$SymbolEquipmentFromJson(json);
}

@freezed
class Symbol with _$Symbol {
  const factory Symbol({
    @JsonKey(name: 'symbol_name') @Default('') String symbolName,
    @JsonKey(name: 'symbol_icon') @Default('') String symbolIcon,
    @JsonKey(name: 'symbol_description') @Default('') String symbolDescription,
    @JsonKey(name: 'symbol_force', fromJson: stringToConvertInt) @Default(0) int symbolForce,
    @JsonKey(name: 'symbol_level') @Default(0) int symbolLevel,
    @JsonKey(name: 'symbol_str', fromJson: stringToConvertInt) @Default(0) int symbolStr,
    @JsonKey(name: 'symbol_dex', fromJson: stringToConvertInt) @Default(0) int symbolDex,
    @JsonKey(name: 'symbol_int', fromJson: stringToConvertInt) @Default(0) int symbolInt,
    @JsonKey(name: 'symbol_luk', fromJson: stringToConvertInt) @Default(0) int symbolLuk,
    @JsonKey(name: 'symbol_hp', fromJson: stringToConvertInt) @Default(0) int symbolHp,
    @JsonKey(name: 'symbol_drop_rate') @Default('') String symbolDropRate,
    @JsonKey(name: 'symbol_meso_rate') @Default('') String symbolMesoRate,
    @JsonKey(name: 'symbol_exp_rate') @Default('') String symbolExpRate,
    @JsonKey(name: 'symbol_growth_count') @Default(0) int symbolGrowthCount,
    @JsonKey(name: 'symbol_require_growth_count') @Default(0) int symbolRequireGrowthCount,
  }) = _Symbol;

  factory Symbol.fromJson(Map<String, dynamic> json) => _$SymbolFromJson(json);
}