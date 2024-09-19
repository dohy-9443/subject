import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice.freezed.dart';

part 'notice.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : notice.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 19..
/// Description      :
///

// 공지사항 목록 조회
@freezed
class Notice with _$Notice {
  const factory Notice({
    @Default([]) List<NoticeElement> notice,
  }) = _Notice;

  factory Notice.fromJson(Map<String, dynamic> json) => _$NoticeFromJson(json);
}

// 공지사항 목록 요소
@freezed
class NoticeElement with _$NoticeElement {
  const factory NoticeElement({
    @Default('') String title,
    @Default('') String url,
    @JsonKey(name: 'notice_id') @Default(0) int noticeId,
    @Default('') String date,
  }) = _NoticeElement;

  factory NoticeElement.fromJson(Map<String, dynamic> json) =>
      _$NoticeElementFromJson(json);
}

// 공지사항 상세조회, 업데이트 상세조회
@freezed
class NoticeDetail with _$NoticeDetail {
  const factory NoticeDetail({
    @Default('') String title,
    @Default('') String url,
    @Default('') String contents,
    @Default('') String date,
  }) = _NoticeDetail;

  factory NoticeDetail.fromJson(Map<String, dynamic> json) => _$NoticeDetailFromJson(json);
}






