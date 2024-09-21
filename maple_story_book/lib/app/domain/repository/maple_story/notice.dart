import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';

///
/// @Project name    : maple_story_book
/// @Class           : notice.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 18..
/// Description      : 
///

abstract class INoticeRepository {
  // 공지사항 목록 조회
  Future<ResultRest<Notice>> getNotice();
  // 공지사항 상세 조회
  Future<ResultRest<NoticeDetail>> getNoticeDetail({required String noticeId});
  // 업데이트 목록 조회
  Future<ResultRest<NoticeUpdate>> getNoticeUpdate();
  // 업데이트 상세 조회
  Future<ResultRest<NoticeDetail>> getNoticeUpdateDetail({required String noticeId});
  // 진행 중 이벤트 목록 조회
  Future<ResultRest<NoticeEvent>> getNoticeEvent();
  // 진행 중 이벤트 상세 조회
  Future<ResultRest<NoticeEventDetail>> getNoticeEventDetail({required String noticeId});
  // 캐시샵 공지 목록 조회
  Future<ResultRest<NoticeCashShop>> getNoticeCashShop();
  // 캐시샵 공지 상세 조회
  Future<ResultRest<NoticeCashShopDetail>> getNoticeCashShopDetail({required String noticeId});
}
