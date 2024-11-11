import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/data/source/model/model.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_event.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_state.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_extension.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 29..
/// Description      : 
///

mixin HomeBlocMixin on Bloc<HomeEvent, HomeState> {
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

  void emitLoading(Emitter<HomeState> emit) {
    emit(const HomeState.loading());
  }

  void emitError(dynamic error, StackTrace? stackTrace, Emitter<HomeState> emit) {
    print('ERROR HOME : $error');
    emit(const HomeState.error(errorMessage: ''));
  }

  Future<void> handleRequest({
    required Future<void> Function() request,
    required Emitter<HomeState> emit,
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
    required Emitter<HomeState> emit,
    required void Function(T) onSuccess,
  }) async {
    if (_cache.containsKey(cacheKey) && !_isCacheExpired(_cache[cacheKey]!)) {
      final cachedData = _cache[cacheKey]!.data as T;
      onSuccess(cachedData);
    } else {
      emit(const HomeState.loading());
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