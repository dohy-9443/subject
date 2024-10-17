import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/use_case/use_case.dart';
import 'package:maple_story_book/app/presentation/all/potential/bloc/potential_event.dart';
import 'package:maple_story_book/app/presentation/all/potential/bloc/potential_state.dart';
import 'package:maple_story_book/app/presentation/all/potential/extension/potential_extension.dart';

///
/// @Project name    : maple_story_book
/// @Class           : potential_bloc.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 30..
/// Description      : 
///

@lazySingleton
class PotentialBloc extends Bloc<IPotentialEvent, IPotentialState> with PotentialBlocMixin {
  final GetHistoryPotentialUseCase _getHistoryPotentialUseCase;
  final GetHistoryCubeUseCase _getHistoryCubeUseCase;

  PotentialBloc(this._getHistoryPotentialUseCase, this._getHistoryCubeUseCase) : super(PotentialInitial()) {
    on<GetPotentialEvent<PotentialHistory>>(getPotentialHistory);
    on<GetPotentialEvent<CubeHistory>>(getCubeHistory);
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

  Future<void> getPotentialHistory(GetPotentialEvent<PotentialHistory> event, Emitter<IPotentialState> emit) async {
    const cacheKey = 'getPotentialHistory';

    if (_cache.containsKey(cacheKey) && !_isCacheExpired(_cache[cacheKey]!)) {
      emit((state as PotentialSuccess).copyWith(potentialHistory: _cache[cacheKey]!.data, isLoading: false));
    } else {
      await handleRequest(
        request: () async {
          final params = PotentialParams(
            count: event.count,
            date: event.date,
            cursor: event.cursor,
          );
          final res = await _getHistoryPotentialUseCase.execute(params);
          if (res.code != 200) throw Exception('code 200 이 아닙니다.');
          _addToCache(cacheKey, res.data);
          emit((state as PotentialSuccess).copyWith(potentialHistory: res.data, isLoading: false));
        },
        emit: emit,
      );
    }
  }

  Future<void> getCubeHistory(GetPotentialEvent<CubeHistory> event, Emitter<IPotentialState> emit) async {
    const cacheKey = 'getCubeHistory';

    if (_cache.containsKey(cacheKey) && !_isCacheExpired(_cache[cacheKey]!)) {
      emit((state as PotentialSuccess).copyWith(cubeHistory: _cache[cacheKey]!.data, isLoading: false));
    } else {
      await handleRequest(
        request: () async {
          final params = PotentialParams(
            count: event.count,
            date: event.date,
            cursor: event.cursor,
          );
          final res = await _getHistoryCubeUseCase.execute(params);
          if (res.code != 200) throw Exception('code 200 이 아닙니다.');
          _addToCache(cacheKey, res.data);
          emit((state as PotentialSuccess).copyWith(cubeHistory: res.data, isLoading: false));
        },
        emit: emit,
      );
    }
  }
}