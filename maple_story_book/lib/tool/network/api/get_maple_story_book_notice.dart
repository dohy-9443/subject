import 'package:maple_story_book/tool/network/network.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_maple_story_book_notice.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

class GetMapleStoryBookNoticeApi {
  final MapleStoryBookRestClient _client;

  GetMapleStoryBookNoticeApi(this._client);

  static String defaultPath = '/maplestory/v1/notice';

  Future<dynamic> getNotice() {
    return _client.get<dynamic>(
      defaultPath,
    ).then((value) => value.data);
  }

  Future<dynamic> getNoticeDetail({required int noticeId}) {
    return _client.get<dynamic>(
      '$defaultPath/detail',
      queryParameters: {
        'notice_id' : noticeId,
      }
    ).then((value) => value.data);
  }

  Future<dynamic> getNoticeUpdate() {
    return _client.get<dynamic>(
      '$defaultPath-update',
    ).then((value) => value.data);
  }

  Future<dynamic> getNoticeUpdateDetail({required int noticeId}) {
    return _client.get<dynamic>(
      '$defaultPath-update/detail',
      queryParameters: {
        'notice_id' : noticeId,
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getNoticeEvent() {
    return _client.get<dynamic>(
      '$defaultPath-event',
    ).then((value) => value.data);
  }

  Future<dynamic> getNoticeEventDetail({required int noticeId}) {
    return _client.get<dynamic>(
      '$defaultPath-event/detail',
      queryParameters: {
        'notice_id' : noticeId,
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getNoticeCashShop() {
    return _client.get<dynamic>(
      '$defaultPath-cashshop',
    ).then((value) => value.data);
  }

  Future<dynamic> getNoticeCashShopDetail({required int noticeId}) {
    return _client.get<dynamic>(
      '$defaultPath-cashshop/detail',
      queryParameters: {
        'notice_id' : noticeId,
      },
    ).then((value) => value.data);
  }
}