import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice_update.freezed.dart';
part 'notice_update.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : notice_update.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 19..
/// Description      :
///

// 업데이트 목록 조회
@freezed
class NoticeUpdate with _$NoticeUpdate {
  const factory NoticeUpdate({
    @JsonKey(name: 'update_notice') @Default([]) List<NoticeUpdateElement> updateNocie,
  }) = _NoticeUpdate;

  factory NoticeUpdate.fromJson(Map<String, dynamic> json) => _$NoticeUpdateFromJson(json);
}

// 업데이트 목록 요소
@freezed
class NoticeUpdateElement with _$NoticeUpdateElement {
  const factory NoticeUpdateElement({
    @Default('') String title,
    @Default('') String url,
    @JsonKey(name: 'notice_id') @Default(0) int noticeId,
    @Default('') String date,
  }) = _NoticeUpdateElement;

  factory NoticeUpdateElement.fromJson(Map<String, dynamic> json) => _$NoticeUpdateElementFromJson(json);
}