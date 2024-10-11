import 'package:freezed_annotation/freezed_annotation.dart';

part 'propensity.freezed.dart';
part 'propensity.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : propensity.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 19..
/// Description      : 
///

@freezed
class Propensity with _$Propensity {
  const factory Propensity({
    String? date,
    @JsonKey(name: 'charisma_level') @Default(0) int charismaLevel,
    @JsonKey(name: 'sensibility_level') @Default(0) int sensibilityLevel,
    @JsonKey(name: 'insight_level') @Default(0) int insightLevel,
    @JsonKey(name: 'willingness_level') @Default(0) int willingnessLevel,
    @JsonKey(name: 'handicraft_level') @Default(0) int handicraftLevel,
    @JsonKey(name: 'charm_level') @Default(0) int charmLevel,
  }) = _Propensity;

  factory Propensity.fromJson(Map<String, dynamic> json) => _$PropensityFromJson(json);

  static (String?, int, int, int, int, int, int) getPropensity(Propensity propensity) {
    return (
      propensity.date,
      propensity.charismaLevel,
      propensity.sensibilityLevel,
      propensity.insightLevel,
      propensity.willingnessLevel,
      propensity.handicraftLevel,
      propensity.charmLevel,
    );
  }
}