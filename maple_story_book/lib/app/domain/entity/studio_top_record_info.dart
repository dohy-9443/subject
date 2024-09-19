import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:maple_story_book/core/util/util.dart';

part 'studio_top_record_info.freezed.dart';
part 'studio_top_record_info.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : studio_top_record_info.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 19..
/// Description      :
///

@freezed
class StudioTopRecordInfo with _$StudioTopRecordInfo {
  const factory StudioTopRecordInfo({
    @Default('') String date,
    @JsonKey(name: 'character_class') @Default('') String characterClass,
    @JsonKey(name: 'world_name') @Default('') String worldName,
    @JsonKey(name: 'dojang_best_floor') @Default(0) int studioBestFloor,
    @JsonKey(name: 'date_dojang_record') String? dateStudioRecord,
    @JsonKey(name: 'dojang_best_time') @Default(0) int studioBestTime,
  }) = _StudioTopRecordInfo;

  factory StudioTopRecordInfo.fromJson(Map<String, dynamic> json) =>
      _$StudioTopRecordInfoFromJson(json);
}