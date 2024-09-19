import 'package:freezed_annotation/freezed_annotation.dart';

part 'notice_cash_shop.freezed.dart';

part 'notice_cash_shop.g.dart';

///
/// @Project name    : maple_story_book
/// @Class           : notice_cash_shop.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 19..
/// Description      :
///

// 캐시샵 공지 목록 조회
@freezed
class NoticeCashShop with _$NoticeCashShop {
  const factory NoticeCashShop({
    @JsonKey(name: 'cashshop_notice') @Default([]) List<NoticeCashShopElement> cashShopNotice,
  }) = _NoticeCashShop;

  factory NoticeCashShop.fromJson(Map<String, dynamic> json) => _$NoticeCashShopFromJson(json);
}

// 캐시샵 공지 목록 요소
@freezed
class NoticeCashShopElement with _$NoticeCashShopElement {
  const factory NoticeCashShopElement({
    @Default('') String title,
    @Default('') String url,
    @JsonKey(name: 'notice_id') @Default(0) int noticeId,
    @Default('') String date,
    @JsonKey(name: 'date_sale_start') @Default('') String dateSaleStart,
    @JsonKey(name: 'date_sale_end') @Default('') String dateSaleEnd,
    @JsonKey(name: 'ongoing_flag') @Default('') String onGoingFlag,
  }) = _NoticeCashShopElement;

  factory NoticeCashShopElement.fromJson(Map<String, dynamic> json) => _$NoticeCashShopElementFromJson(json);
}

// 캐시샵 공지 상세 조회
@freezed
class NoticeCashShopDetail with _$NoticeCashShopDetail {
  const factory NoticeCashShopDetail({
    @Default('') String title,
    @Default('') String url,
    @Default('') String contents,
    @Default('') String date,
    @JsonKey(name: 'date_sale_start') @Default('') String dateSaleStart,
    @JsonKey(name: 'date_sale_end') @Default('') String dateSaleEnd,
    @JsonKey(name: 'ongoing_flag') @Default('') String onGoingFlag,
  }) = _NoticeCashShopDetail;

  factory NoticeCashShopDetail.fromJson(Map<String, dynamic> json) => _$NoticeCashShopDetailFromJson(json);
}