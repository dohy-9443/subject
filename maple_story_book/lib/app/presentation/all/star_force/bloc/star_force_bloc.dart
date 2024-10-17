import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/use_case/use_case.dart';
import 'package:maple_story_book/app/presentation/all/star_force/bloc/star_force_event.dart';
import 'package:maple_story_book/app/presentation/all/star_force/bloc/star_force_state.dart';

///
/// @Project name    : maple_story_book
/// @Class           : starForce_bloc.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 30..
/// Description      : 
///

@lazySingleton
class StarForceBloc extends Bloc<IStarForceEvent, IStarForceState> {
  final GetHistoryStarForceUseCase _getHistoryStarForceUseCase;

  StarForceBloc(this._getHistoryStarForceUseCase,) : super(StarForceInitial()) {
    on<GetStarForceEvent>(getStarForceHistory);
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

  Future<void> getStarForceHistory(GetStarForceEvent event, Emitter<IStarForceState> emit) async {
    const cacheKey = 'getStarForceHistory';

    if (state is StarForceSuccess) {
      emit((state as StarForceSuccess).copyWith(isLoading: true));
    } else {
      emit(StarForceSuccess(isLoading: true));
    }

    try {
      if (_cache.containsKey(cacheKey) && !_isCacheExpired(_cache[cacheKey]!)) {
        emit((state as StarForceSuccess).copyWith(starForceHistory: _cache[cacheKey]!.data, isLoading: false));
      } else {

        final params = PotentialParams(
          count: event.count,
          date: event.date,
          cursor: event.cursor,
        );
        final res = await _getHistoryStarForceUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        _addToCache(cacheKey, res.data);
        emit((state as StarForceSuccess).copyWith(starForceHistory: res.data, isLoading: false));
      }
    } catch (e, s) {
      emit(StarForceError(error: e, stackTrace: s));
    }
  }
}