import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/model/model.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/use_case/use_case.dart';
import 'package:maple_story_book/app/presentation/all/notice/bloc/notice_event.dart';
import 'package:maple_story_book/app/presentation/all/notice/bloc/notice_state.dart';
import 'package:maple_story_book/app/presentation/all/notice/extension/notice_extension.dart';

///
/// @Project name    : maple_story_book
/// @Class           : notice_bloc.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 30..
/// Description      :
///

@lazySingleton
class NoticeBloc extends Bloc<INoticeEvent, INoticeState> with NoticeBlocMixin {
  final GetNoticeUseCase _getNoticeUseCase;
  final GetNoticeDetailUseCase _getNoticeDetailUseCase;
  final GetNoticeUpdateUseCase _getNoticeUpdateUseCase;
  final GetNoticeUpdateDetailUseCase _getNoticeUpdateDetailUseCase;
  final GetNoticeCashShopUseCase _getNoticeCashShopUseCase;
  final GetNoticeCashShopDetailUseCase _getNoticeCashShopDetailUseCase;
  final GetNoticeEventUseCase _getNoticeEventUseCase;
  final GetNoticeEventDetailUseCase _getNoticeEventDetailUseCase;

  NoticeBloc(
    this._getNoticeUseCase,
    this._getNoticeCashShopUseCase,
    this._getNoticeUpdateUseCase,
    this._getNoticeUpdateDetailUseCase,
    this._getNoticeCashShopDetailUseCase,
    this._getNoticeEventUseCase,
    this._getNoticeEventDetailUseCase,
    this._getNoticeDetailUseCase,
  ) : super(NoticeInitial()) {
    on<GetNoticeEvent<Notice>>(getNotice);
    on<GetNoticeEvent<NoticeDetail>>(getNoticeDetail);
    on<GetNoticeEvent<NoticeUpdate>>(getNoticeUpdate);
    on<GetNoticeEvent<NoticeUpdateDetail>>(getNoticeUpdateDetail);
    on<GetNoticeEvent<NoticeCashShop>>(getNoticeCashShop);
    on<GetNoticeEvent<NoticeCashShopDetail>>(getNoticeCashShopDetail);
    on<GetNoticeEvent<NoticeEvent>>(getNoticeEvent);
    on<GetNoticeEvent<NoticeEventDetail>>(getNoticeEventDetail);
  }

  Future<void> getNotice(GetNoticeEvent event, Emitter<INoticeState> emit) async {
    await handleRequest(
      request: () async {
        final res = await _getNoticeUseCase.execute();
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as NoticeSuccess).copyWith(isLoading: false));
      },
      emit: emit,
    );
  }

  Future<void> getNoticeDetail(GetNoticeEvent event, Emitter<INoticeState> emit) async {
    await handleRequest(
      request: () async {
        final params = NoticeParams(noticeId: event.noticeId,);
        final res = await _getNoticeDetailUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as NoticeSuccess).copyWith(isLoading: false));
      },
      emit: emit,
    );
  }

  Future<void> getNoticeUpdate(GetNoticeEvent event, Emitter<INoticeState> emit) async {
    await handleRequest(
      request: () async {
        final res = await _getNoticeUpdateUseCase.execute();
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as NoticeSuccess).copyWith(noticeUpdate: res.data, isLoading: false));
      },
      emit: emit,
    );
  }

  Future<void> getNoticeUpdateDetail(GetNoticeEvent event, Emitter<INoticeState> emit) async {
    await handleRequest(
      request: () async {
        final params = NoticeParams(noticeId: event.noticeId,);
        final res = await _getNoticeUpdateDetailUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as NoticeSuccess).copyWith(noticeUpdateDetail: res.data, isLoading: false));
      },
      emit: emit,
    );
  }

  Future<void> getNoticeCashShop(GetNoticeEvent event, Emitter<INoticeState> emit) async {
    await handleRequest(
      request: () async {
        final res = await _getNoticeCashShopUseCase.execute();
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as NoticeSuccess).copyWith(noticeCashShop: res.data, isLoading: false));
      },
      emit: emit,
    );
  }

  Future<void> getNoticeCashShopDetail(GetNoticeEvent event, Emitter<INoticeState> emit) async {
    await handleRequest(
      request: () async {
        final params = NoticeParams(noticeId: event.noticeId,);
        final res = await _getNoticeCashShopDetailUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as NoticeSuccess).copyWith(noticeCashShopDetail: res.data, isLoading: false));
      },
      emit: emit,
    );
  }

  Future<void> getNoticeEvent(GetNoticeEvent event, Emitter<INoticeState> emit) async {
    await handleRequest(
      request: () async {
        final res = await _getNoticeEventUseCase.execute();
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as NoticeSuccess).copyWith(noticeEvent: res.data, isLoading: false));
      },
      emit: emit,
    );
  }

  Future<void> getNoticeEventDetail(GetNoticeEvent event, Emitter<INoticeState> emit) async {
    await handleRequest(
      request: () async {
        final params = NoticeParams(noticeId: event.noticeId,);
        final res = await _getNoticeEventDetailUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as NoticeSuccess).copyWith(noticeEventDetail: res.data, isLoading: false));
      },
      emit: emit,
    );
  }
}
