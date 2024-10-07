import 'package:equatable/equatable.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';

///
/// @Project name    : maple_story_book
/// @Class           : notice_state.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 30..
/// Description      :
///

sealed class INoticeState extends Equatable {}

class NoticeInitial extends INoticeState {
  NoticeInitial();

  @override
  List<Object?> get props => [];
}

class NoticeSuccess extends INoticeState {
  final bool isLoading;
  final Notice? notice;
  final NoticeDetail? noticeDetail;
  final NoticeCashShop? noticeCashShop;
  final NoticeCashShopDetail? noticeCashShopDetail;
  final NoticeEvent? noticeEvent;
  final NoticeEventDetail? noticeEventDetail;
  final NoticeUpdate? noticeUpdate;
  final NoticeUpdateDetail? noticeUpdateDetail;

  NoticeSuccess({
    this.isLoading = false,
    this.notice,
    this.noticeDetail,
    this.noticeCashShop,
    this.noticeCashShopDetail,
    this.noticeEvent,
    this.noticeEventDetail,
    this.noticeUpdate,
    this.noticeUpdateDetail,
  });

  NoticeSuccess copyWith({
    bool? isLoading,
    Notice? notice,
    NoticeDetail? noticeDetail,
    NoticeCashShop? noticeCashShop,
    NoticeCashShopDetail? noticeCashShopDetail,
    NoticeEvent? noticeEvent,
    NoticeEventDetail? noticeEventDetail,
    NoticeUpdate? noticeUpdate,
    NoticeUpdateDetail? noticeUpdateDetail,
  }) {
    return NoticeSuccess(
      isLoading: isLoading ?? this.isLoading,
      notice: notice ?? this.notice,
      noticeDetail: noticeDetail ?? this.noticeDetail,
      noticeCashShop: noticeCashShop ?? this.noticeCashShop,
      noticeCashShopDetail: noticeCashShopDetail ?? this.noticeCashShopDetail,
      noticeEvent: noticeEvent ?? this.noticeEvent,
      noticeEventDetail: noticeEventDetail ?? this.noticeEventDetail,
      noticeUpdate: noticeUpdate ?? this.noticeUpdate,
      noticeUpdateDetail: noticeUpdateDetail ?? this.noticeUpdateDetail,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        notice,
        noticeDetail,
        noticeCashShop,
        noticeCashShopDetail,
        noticeEvent,
        noticeEventDetail,
        noticeUpdate,
        noticeUpdateDetail,
      ];
}

class NoticeError extends INoticeState {
  final dynamic error;
  final StackTrace? stackTrace;

  NoticeError({required this.error, required this.stackTrace});

  @override
  List<Object?> get props => [error, stackTrace];
}
