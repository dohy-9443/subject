import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice_event.freezed.dart';

part 'notice_event.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : notice_event.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 19..
/// Description      :
///

// 진행 중 이벤트 목록 조회
@freezed
class NoticeEvent with _$NoticeEvent {
  const factory NoticeEvent({
    @JsonKey(name: 'event_notice') @Default([]) List<NoticeEventElement> eventNotice,
  }) = _NoticeEvent;

  factory NoticeEvent.fromJson(Map<String, dynamic> json) => _$NoticeEventFromJson(json);
}

// 진행 중 이벤트 목록 요소
@freezed
class NoticeEventElement with _$NoticeEventElement {
  const factory NoticeEventElement({
    @Default('') String title,
    @Default('') String url,
    @JsonKey(name: 'notice_id') @Default(0) int noticeId,
    @Default('') String date,
    @JsonKey(name: 'date_event_start') @Default('') String dateEventStart,
    @JsonKey(name: 'date_event_end') @Default('') String dateEventEnd,
  }) = _NoticeEventElement;

  factory NoticeEventElement.fromJson(Map<String, dynamic> json) => _$NoticeEventElementFromJson(json);
}

// 진행 중 이벤트 상세 조회
@freezed
class NoticeEventDetail with _$NoticeEventDetail {
  const factory NoticeEventDetail({
    @Default('') String title,
    @Default('') String url,
    @Default('') String contents,
    @Default('') String date,
    @JsonKey(name: 'date_event_start') @Default('') String dateEventStart,
    @JsonKey(name: 'date_event_end') @Default('') String dateEventEnd,
  }) = _NoticeEventDetail;

  factory NoticeEventDetail.fromJson(Map<String, dynamic> json) => _$NoticeEventDetailFromJson(json);
}