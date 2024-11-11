import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/use_case/use_case.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/extension/ranking_extension.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_event.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_state.dart';

///
/// @Project name    : maple_story_book
/// @Class           : ranking_bloc.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 30..
/// Description      :
///

@lazySingleton
class RankingBloc extends Bloc<RankingEvent, RankingState> with RankingBlocMixin {
  final GetRankingAchievementUseCase _getRankingAchievementUseCase;
  final GetRankingGuildUseCase _getRankingGuildUseCase;
  final GetRankingOverallUseCase _getRankingOverallUseCase;
  final GetRankingStudioUseCase _getRankingStudioUseCase;
  final GetRankingTheSeedUseCase _getRankingTheSeedUseCase;
  final GetRankingUnionUseCase _getRankingUnionUseCase;

  RankingBloc(
    this._getRankingAchievementUseCase,
    this._getRankingGuildUseCase,
    this._getRankingOverallUseCase,
    this._getRankingStudioUseCase,
    this._getRankingTheSeedUseCase,
    this._getRankingUnionUseCase,
  ) : super(const RankingState.initial()) {
    on<GetRankingEvent<RankingAchievement>>(getRankingAchievement);
    on<GetRankingGuildEvent<RankingGuild>>(getRankingGuild);
    on<GetRankingOverallEvent<RankingOverall>>(getRankingOverall);
    on<GetRankingStudioEvent<RankingStudio>>(getRankingStudio);
    on<GetRankingEvent<RankingTheSeed>>(getRankingTheSeed);
    on<GetRankingEvent<RankingUnion>>(getRankingUnion);
    on<SelectWorldFilterEvent>(selectWorldFilter);
  }

  static const Duration cacheDuration = Duration(minutes: 10);
  static const int maxCacheSize = 10;

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

  Future<void> _fetchData<T>({
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

  Future<void> getRankingAchievement(GetRankingEvent event, Emitter<RankingState> emit) async {
    await _fetchData<RankingAchievement>(
      cacheKey: 'getRankingAchievement',
      fetchFunction: () async {
        final params = RankingParams(
          date: event.date,
          worldName: event.worldName,
          ocid: event.ocid,
          page: event.page,
        );
        final res = await _getRankingAchievementUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('Ability data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) => emit(RankingState.success(rankingAchievement: data)),
    );
  }

  Future<void> getRankingGuild(GetRankingGuildEvent event, Emitter<RankingState> emit) async {
    await _fetchData<RankingGuild>(
      cacheKey: 'getRankingGuild',
      fetchFunction: () async {
        final params = RankingGuildParams(
          date: event.date,
          worldName: event.worldName,
          rankingType: event.rankingType,
          guildName: event.guildName,
          page: event.page,
        );
        final res = await _getRankingGuildUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('Ability data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) => emit(RankingState.success(rankingGuild: data)),
    );
  }

  Future<void> getRankingOverall(GetRankingOverallEvent event, Emitter<RankingState> emit) async {
    await _fetchData<RankingOverall>(
      cacheKey: 'getRankingOverall',
      fetchFunction: () async {
        final params = RankingOverallParams(
          date: event.date,
          worldName: event.worldName,
          worldType: event.worldType,
          availableValue: event.availableValue,
          ocid: event.ocid,
          page: event.page,
        );
        final res = await _getRankingOverallUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('Ability data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) => emit(RankingState.success(rankingOverall: data)),
    );
  }

  Future<void> getRankingStudio(GetRankingStudioEvent event, Emitter<RankingState> emit) async {
    await _fetchData<RankingStudio>(
      cacheKey: 'getRankingStudio',
      fetchFunction: () async {
        final params = RankingStudioParams(
          date: event.date,
          worldName: event.worldName,
          difficulty: event.difficulty,
          availableValue: event.availableValue,
          ocid: event.ocid,
          page: event.page,
        );
        final res = await _getRankingStudioUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('Ability data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) => emit(RankingState.success(rankingStudio: data)),
    );
  }

  Future<void> getRankingTheSeed(GetRankingEvent event, Emitter<RankingState> emit) async {
    await _fetchData<RankingTheSeed>(
      cacheKey: 'getRankingTheSeed',
      fetchFunction: () async {
        final params = RankingParams(
          date: event.date,
          worldName: event.worldName,
          ocid: event.ocid,
          page: event.page,
        );
        final res = await _getRankingTheSeedUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('Ability data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) => emit(RankingState.success(rankingTheSeed: data)),
    );
  }

  Future<void> getRankingUnion(GetRankingEvent event, Emitter<RankingState> emit) async {
    await _fetchData<RankingUnion>(
      cacheKey: 'getRankingUnion',
      fetchFunction: () async {
        final params = RankingParams(
          date: event.date,
          worldName: event.worldName,
          ocid: event.ocid,
          page: event.page,
        );
        final res = await _getRankingUnionUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('Ability data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) => emit(RankingState.success(rankingUnion: data)),
    );
  }

  void selectWorldFilter(SelectWorldFilterEvent event, Emitter<RankingState> emit) {
    emit(RankingState.success(selectWorldName: event.selectWorldName));
    try {
      switch (event.tabIndex) {
        case 0:
          add(GetRankingOverallEvent<RankingOverall>(
            date: DateTime.now().subtract(const Duration(days: 3)),
            worldName: event.selectWorldName,
          ));
          break;
        case 1:
          add(GetRankingEvent<RankingUnion>(
            date: DateTime.now().subtract(const Duration(days: 3)),
            worldName: event.selectWorldName,
          ));
          break;
        case 2:
          add(GetRankingGuildEvent<RankingGuild>(
            date: DateTime.now().subtract(const Duration(days: 3)),
            worldName: event.selectWorldName, rankingType: 0, guildName: '', page: 0,
          ));
          break;
        case 3:
          add(GetRankingStudioEvent<RankingStudio>(
            date: DateTime.now().subtract(const Duration(days: 3)),
            worldName: event.selectWorldName, difficulty: 0,
          ));
          break;
        case 4:
          add(GetRankingEvent<RankingTheSeed>(
            date: DateTime.now().subtract(const Duration(days: 3)),
            worldName: event.selectWorldName,
          ));
          break;
        case 5:
          add(GetRankingEvent<RankingAchievement>(
            date: DateTime.now().subtract(const Duration(days: 3)),
            worldName: event.selectWorldName,
          ));
          break;
      }
      emit(RankingState.success(
        selectWorldName: event.selectWorldName,
        selectWorldIndex: event.selectWorldIndex,
      ));
    } catch (e) {
      print(e);
    }
  }
}
