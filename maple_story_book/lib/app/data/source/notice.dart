import 'package:maple_story_book/tool/network/api/api.dart';

///
/// @Project name    : maple_story_book
/// @Class           : notice.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 27..
/// Description      :
///

abstract class IGetNoticeDataSource {
  getNotice();
  getNoticeDetail({required int noticeId});
  getNoticeUpdate();
  getNoticeUpdateDetail({required int noticeId});
  getNoticeEvent();
  getNoticeEventDetail({required int noticeId});
  getNoticeCashShop();
  getNoticeCashShopDetail({required int noticeId});
}

class NoticeDataSource implements IGetNoticeDataSource {
  final GetMapleStoryBookNoticeApi _api;

  NoticeDataSource(this._api);

  @override
  getNotice() {
    return _api.getNotice();
  }

  @override
  getNoticeCashShop() {
    return _api.getNoticeCashShop();
  }

  @override
  getNoticeCashShopDetail({required int noticeId}) {
    return _api.getNoticeCashShopDetail(noticeId: noticeId);
  }

  @override
  getNoticeDetail({required int noticeId}) {
    return _api.getNoticeDetail(noticeId: noticeId);
  }

  @override
  getNoticeEvent() {
    return _api.getNoticeEvent();
  }

  @override
  getNoticeEventDetail({required int noticeId}) {
    return _api.getNoticeEventDetail(noticeId: noticeId);
  }

  @override
  getNoticeUpdate() {
    return _api.getNoticeUpdate();
  }

  @override
  getNoticeUpdateDetail({required int noticeId}) {
    return _api.getNoticeUpdateDetail(noticeId: noticeId);
  }
}