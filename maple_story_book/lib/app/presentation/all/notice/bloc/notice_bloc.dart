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

  static const Duration cacheDuration = Duration(minutes: 10);
  static const int maxCacheSize = 20;

  final Map<String, CacheEntry> _cache = {};
  final List<String> _cacheKeys = [];

  void _addToCache(String key, dynamic data) {
    if (_cacheKeys.length >= maxCacheSize) {
      final oldestKey = _cacheKeys.removeAt(0);
      _cache.remove(oldestKey);
    }
    _cache[key] = CacheEntry(data, DateTime.now());
    _cacheKeys.add(key);
  }

  bool _isCacheExpired(CacheEntry entry) {
    return DateTime.now().difference(entry.cacheTime) > cacheDuration;
  }

  Future<void> getNotice(GetNoticeEvent event, Emitter<INoticeState> emit) async {
    const cacheKey = 'getNotice';

    if (_cache.containsKey(cacheKey) && !_isCacheExpired(_cache[cacheKey]!)) {
      emit((state as NoticeSuccess).copyWith(notice: _cache[cacheKey]!.data, isLoading: false));
    } else {
      await handleRequest(
        request: () async {
          final res = await _getNoticeUseCase.execute();
          if (res.code != 200) throw Exception('code 200 이 아닙니다.');
          _addToCache(cacheKey, res.data);
          emit((state as NoticeSuccess).copyWith(notice: res.data, isLoading: false));
        },
        emit: emit,
      );
    }
  }

  Future<void> getNoticeDetail(GetNoticeEvent event, Emitter<INoticeState> emit) async {
    const cacheKey = 'getNoticeDetail';

    if (_cache.containsKey(cacheKey) && !_isCacheExpired(_cache[cacheKey]!)) {
      emit((state as NoticeSuccess).copyWith(noticeDetail: _cache[cacheKey]!.data, isLoading: false));
    } else {
      await handleRequest(
        request: () async {
          final params = NoticeParams(noticeId: event.noticeId,);
          final res = await _getNoticeDetailUseCase.execute(params);
          if (res.code != 200) throw Exception('code 200 이 아닙니다.');
          _addToCache(cacheKey, res.data);
          emit((state as NoticeSuccess).copyWith(noticeDetail: res.data, isLoading: false));
        },
        emit: emit,
      );
    }


  }

  Future<void> getNoticeUpdate(GetNoticeEvent event, Emitter<INoticeState> emit) async {
    const cacheKey = 'getNoticeUpdate';

    if (_cache.containsKey(cacheKey) && !_isCacheExpired(_cache[cacheKey]!)) {
      emit((state as NoticeSuccess).copyWith(noticeUpdate: _cache[cacheKey]!.data, isLoading: false));
    } else {
      await handleRequest(
        request: () async {
          final res = await _getNoticeUpdateUseCase.execute();
          if (res.code != 200) throw Exception('code 200 이 아닙니다.');
          _addToCache(cacheKey, res.data);
          emit((state as NoticeSuccess).copyWith(noticeUpdate: res.data, isLoading: false));
        },
        emit: emit,
      );
    }
  }

  Future<void> getNoticeUpdateDetail(GetNoticeEvent event, Emitter<INoticeState> emit) async {
    const cacheKey = 'getNoticeUpdateDetail';

    if (_cache.containsKey(cacheKey) && !_isCacheExpired(_cache[cacheKey]!)) {
      emit((state as NoticeSuccess).copyWith(noticeUpdateDetail: _cache[cacheKey]!.data, isLoading: false));
    } else {
      await handleRequest(
        request: () async {
          final params = NoticeParams(noticeId: event.noticeId,);
          final res = await _getNoticeUpdateDetailUseCase.execute(params);
          if (res.code != 200) throw Exception('code 200 이 아닙니다.');
          _addToCache(cacheKey, res.data);
          emit((state as NoticeSuccess).copyWith(noticeUpdateDetail: res.data, isLoading: false));
        },
        emit: emit,
      );
    }
  }

  Future<void> getNoticeCashShop(GetNoticeEvent event, Emitter<INoticeState> emit) async {
    const cacheKey = 'getNoticeCashShop';

    if (_cache.containsKey(cacheKey) && !_isCacheExpired(_cache[cacheKey]!)) {
      emit((state as NoticeSuccess).copyWith(noticeCashShop: _cache[cacheKey]!.data, isLoading: false));
    } else {
      await handleRequest(
        request: () async {
          final res = await _getNoticeCashShopUseCase.execute();
          if (res.code != 200) throw Exception('code 200 이 아닙니다.');
          _addToCache(cacheKey, res.data);
          emit((state as NoticeSuccess).copyWith(noticeCashShop: res.data, isLoading: false));
        },
        emit: emit,
      );
    }
  }

  Future<void> getNoticeCashShopDetail(GetNoticeEvent event, Emitter<INoticeState> emit) async {
    const cacheKey = 'getNoticeCashShopDetail';

    if (_cache.containsKey(cacheKey) && !_isCacheExpired(_cache[cacheKey]!)) {
      emit((state as NoticeSuccess).copyWith(noticeCashShopDetail: _cache[cacheKey]!.data, isLoading: false));
    } else {
      await handleRequest(
        request: () async {
          final params = NoticeParams(noticeId: event.noticeId,);
          final res = await _getNoticeCashShopDetailUseCase.execute(params);
          if (res.code != 200) throw Exception('code 200 이 아닙니다.');
          _addToCache(cacheKey, res.data);
          emit((state as NoticeSuccess).copyWith(noticeCashShopDetail: res.data, isLoading: false));
        },
        emit: emit,
      );
    }
  }

  Future<void> getNoticeEvent(GetNoticeEvent event, Emitter<INoticeState> emit) async {
    const cacheKey = 'getNoticeEvent';

    if (_cache.containsKey(cacheKey) && !_isCacheExpired(_cache[cacheKey]!)) {
      emit((state as NoticeSuccess).copyWith(noticeEvent: _cache[cacheKey]!.data, isLoading: false));
    } else {
      await handleRequest(
        request: () async {
          final res = await _getNoticeEventUseCase.execute();
          if (res.code != 200) throw Exception('code 200 이 아닙니다.');
          _addToCache(cacheKey, res.data);
          emit((state as NoticeSuccess).copyWith(noticeEvent: res.data, isLoading: false));
        },
        emit: emit,
      );
    }
  }

  Future<void> getNoticeEventDetail(GetNoticeEvent event, Emitter<INoticeState> emit) async {
    const cacheKey = 'getNoticeEventDetail';

    if (_cache.containsKey(cacheKey) && !_isCacheExpired(_cache[cacheKey]!)) {
      emit((state as NoticeSuccess).copyWith(noticeEventDetail: _cache[cacheKey]!.data, isLoading: false));
    } else {
      await handleRequest(
        request: () async {
          final params = NoticeParams(noticeId: event.noticeId,);
          final res = await _getNoticeEventDetailUseCase.execute(params);
          if (res.code != 200) throw Exception('code 200 이 아닙니다.');
          _addToCache(cacheKey, res.data);
          emit((state as NoticeSuccess).copyWith(noticeEventDetail: res.data, isLoading: false));
        },
        emit: emit,
      );
    }
  }
}
