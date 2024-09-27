import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/notice.dart';
import 'package:maple_story_book/app/domain/entity/notice_cash_shop.dart';
import 'package:maple_story_book/app/domain/entity/notice_event.dart';
import 'package:maple_story_book/app/domain/entity/notice_update.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/extension/base_response.dart';

///
/// @Project name    : maple_story_book
/// @Class           : notice.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 27..
/// Description      :
///

@lazySingleton
class NoticeRepository with BaseResponse implements INoticeRepository {
  final NoticeDataSource _noticeDataSource;

  NoticeRepository(this._noticeDataSource);

  @override
  Future<ResultRest<Notice>> getNotice() {
    return handleApiResponse<Notice>(
        request: () => _noticeDataSource.getNotice(),
        fromJson: (json) => Notice.fromJson(json));
  }

  @override
  Future<ResultRest<NoticeCashShop>> getNoticeCashShop() {
    return handleApiResponse<NoticeCashShop>(
      request: () => _noticeDataSource.getNoticeCashShop(),
      fromJson: (json) => NoticeCashShop.fromJson(json),
    );
  }

  @override
  Future<ResultRest<NoticeCashShopDetail>> getNoticeCashShopDetail({required int noticeId}) {
    return handleApiResponse<NoticeCashShopDetail>(
      request: () =>
          _noticeDataSource.getNoticeCashShopDetail(noticeId: noticeId),
      fromJson: (json) => NoticeCashShopDetail.fromJson(json),
    );
  }

  @override
  Future<ResultRest<NoticeDetail>> getNoticeDetail({required int noticeId}) {
    return handleApiResponse<NoticeDetail>(
      request: () => _noticeDataSource.getNoticeDetail(noticeId: noticeId),
      fromJson: (json) => NoticeDetail.fromJson(json),
    );
  }

  @override
  Future<ResultRest<NoticeEvent>> getNoticeEvent() {
    return handleApiResponse<NoticeEvent>(
      request: () => _noticeDataSource.getNoticeEvent(),
      fromJson: (json) => NoticeEvent.fromJson(json),
    );
  }

  @override
  Future<ResultRest<NoticeEventDetail>> getNoticeEventDetail({required int noticeId}) {
    return handleApiResponse<NoticeEventDetail>(
      request: () => _noticeDataSource.getNoticeEventDetail(noticeId: noticeId),
      fromJson: (json) => NoticeEventDetail.fromJson(json),
    );
  }

  @override
  Future<ResultRest<NoticeUpdate>> getNoticeUpdate() {
    return handleApiResponse<NoticeUpdate>(
      request: () => _noticeDataSource.getNoticeUpdate(),
      fromJson: (json) => NoticeUpdate.fromJson(json),
    );
  }

  @override
  Future<ResultRest<NoticeDetail>> getNoticeUpdateDetail({required int noticeId}) {
    return handleApiResponse<NoticeDetail>(
      request: () =>
          _noticeDataSource.getNoticeUpdateDetail(noticeId: noticeId),
      fromJson: (json) => NoticeDetail.fromJson(json),
    );
  }
}