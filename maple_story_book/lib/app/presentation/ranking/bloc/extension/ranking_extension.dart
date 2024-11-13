import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/data/source/model/model.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
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
    if (state is RankingSuccess) {
      emit((state as RankingSuccess).copyWith(isLoading: true));
    } else {
      emit(const RankingState.success(
        rankingAchievement: RankingAchievement(),
        rankingGuild: RankingGuild(),
        rankingOverall: RankingOverall(),
        rankingStudio: RankingStudio(),
        rankingTheSeed: RankingTheSeed(),
        rankingUnion: RankingUnion(),
        selectWorldName: '',
        selectWorldIndex: 0,
        isLoading: true,
      ));
    }
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

extension RankingBlocExtension on RankingState {
  void emitSuccess(
      Emitter<RankingState> emit, {
        RankingAchievement? rankingAchievement,
        RankingGuild? rankingGuild,
        RankingOverall? rankingOverall,
        RankingStudio? rankingStudio,
        RankingTheSeed? rankingTheSeed,
        RankingUnion? rankingUnion,
        String? selectWorldName,
        int? selectWorldIndex,
        bool isLoading = false,
      }) {
    if (this is RankingSuccess) {
      emit(
        (this as RankingSuccess).copyWith(
          rankingAchievement: rankingAchievement ?? (this as RankingSuccess).rankingAchievement,
          rankingGuild: rankingGuild ?? (this as RankingSuccess).rankingGuild,
          rankingOverall: rankingOverall ?? (this as RankingSuccess).rankingOverall,
          rankingStudio: rankingStudio ?? (this as RankingSuccess).rankingStudio,
          rankingTheSeed: rankingTheSeed ?? (this as RankingSuccess).rankingTheSeed,
          rankingUnion: rankingUnion ?? (this as RankingSuccess).rankingUnion,
          selectWorldName: selectWorldName ?? (this as RankingSuccess).selectWorldName,
          selectWorldIndex: selectWorldIndex ?? (this as RankingSuccess).selectWorldIndex,
          isLoading: isLoading,
        ),
      );
    } else {
      emit(RankingState.success(
        rankingAchievement: rankingAchievement ?? const RankingAchievement(),
        rankingGuild: rankingGuild ?? const RankingGuild(),
        rankingOverall: rankingOverall ?? const RankingOverall(),
        rankingStudio: rankingStudio ?? const RankingStudio(),
        rankingTheSeed: rankingTheSeed ?? const RankingTheSeed(),
        rankingUnion: rankingUnion ?? const RankingUnion(),
        selectWorldName: selectWorldName ?? '',
        selectWorldIndex: selectWorldIndex ?? 0,
        isLoading: isLoading,
      ));
    }
  }
}