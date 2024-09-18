import 'package:freezed_annotation/freezed_annotation.dart';

part 'ocid.freezed.dart';
part 'ocid.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : ocid.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 18..
/// Description      : 
///

@freezed
class Ocid with _$Ocid {
  const factory Ocid({
    @Default('') String ocid,
}) = _Ocid;

  factory Ocid.fromJson(Map<String, dynamic> json) => _$OcidFromJson(json);
}