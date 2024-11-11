import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/data/source/model/model.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_event.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_state.dart';

///
/// @Project name    : maple_story_book
/// @Class           : ranking_extension.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 30..
/// Description      :
///

mixin RankingBlocMixin on Bloc<RankingEvent, RankingState> {
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

  void emitLoading(Emitter<RankingState> emit) {
    emit(const RankingState.loading());
  }

  void emitError(dynamic error, StackTrace? stackTrace, Emitter<RankingState> emit) {
    emit(const RankingState.error(errorMessage: ''));
  }

  Future<void> handleRequest({
    required Future<void> Function() request,
    required Emitter<RankingState> emit,
  }) async {
    emitLoading(emit);
    try {
      await request();
    } catch (e, s) {
      emitError(e, s, emit);
    }
  }

  Future<void> fetchData<T>({
    required String cacheKey,
    required Future<T> Function() fetchFunction,
    required Emitter<RankingState> emit,
    required void Function(T) onSuccess,
  }) async {
    if (_cache.containsKey(cacheKey) && !_isCacheExpired(_cache[cacheKey]!)) {
      final cachedData = _cache[cacheKey]!.data as T;
      onSuccess(cachedData);
    } else {
      emit(const RankingState.loading());
      await handleRequest(
        request: () async {
          final data = await fetchFunction();
          _addToCache(cacheKey, data);
          onSuccess(data);
        },
        emit: emit,
      );
    }
  }
}

