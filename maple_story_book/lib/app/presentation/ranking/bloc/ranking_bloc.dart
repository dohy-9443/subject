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
class RankingBloc extends Bloc<IRankingEvent, IRankingState>
    with RankingBlocMixin {
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
  ) : super(RankingInitial()) {
    on<GetRankingEvent<RankingAchievement>>(getRankingAchievement);
    on<GetRankingGuildEvent<RankingGuild>>(getRankingGuild);
    on<GetRankingOverallEvent<RankingOverall>>(getRankingOverall);
    on<GetRankingStudioEvent<RankingStudio>>(getRankingStudio);
    on<GetRankingEvent<RankingTheSeed>>(getRankingTheSeed);
    on<GetRankingEvent<RankingUnion>>(getRankingUnion);
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
  
  Future<void> getRankingAchievement(GetRankingEvent event, Emitter<IRankingState> emit) async {
    const cacheKey = 'getRankingAchievement';

    if (_cache.containsKey(cacheKey) && !_isCacheExpired(_cache[cacheKey]!)) {
      emit((state as RankingSuccess).copyWith(rankingAchievement: _cache[cacheKey]!.data, isLoading: false));
    } else {
      await handleRequest(
        request: () async {
          final params = RankingParams(
            date: event.date,
            worldName: event.worldName,
            ocid: event.ocid,
            page: event.page,
          );
          final res = await _getRankingAchievementUseCase.execute(params);
          if (res.code != 200) throw Exception('code 200 이 아닙니다.');
          _addToCache(cacheKey, res.data);
          emit((state as RankingSuccess).copyWith(rankingAchievement: res.data, isLoading: false));
        },
        emit: emit,
      );
    }
  }

  Future<void> getRankingGuild(
      GetRankingGuildEvent event, Emitter<IRankingState> emit) async {
    const cacheKey = 'getRankingGuild';

    if (_cache.containsKey(cacheKey) && !_isCacheExpired(_cache[cacheKey]!)) {
      emit((state as RankingSuccess).copyWith(rankingGuild: _cache[cacheKey]!.data, isLoading: false));
    } else {
      await handleRequest(
        request: () async {
          final params = RankingGuildParams(
            date: event.date,
            worldName: event.worldName,
            rankingType: event.rankingType,
            guildName: event.guildName,
            page: event.page,
          );
          final res = await _getRankingGuildUseCase.execute(params);
          if (res.code != 200) throw Exception('code 200 이 아닙니다.');
          _addToCache(cacheKey, res.data);
          emit((state as RankingSuccess)
              .copyWith(rankingGuild: res.data, isLoading: false));
        },
        emit: emit,
      );
    }
  }

  Future<void> getRankingOverall(
      GetRankingOverallEvent event, Emitter<IRankingState> emit) async {
    const cacheKey = 'getRankingOverall';

    if (_cache.containsKey(cacheKey) && !_isCacheExpired(_cache[cacheKey]!)) {
      emit((state as RankingSuccess).copyWith(rankingOverall: _cache[cacheKey]!.data, isLoading: false));
    } else {
      await handleRequest(
        request: () async {
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
          _addToCache(cacheKey, res.data);
          emit((state as RankingSuccess)
              .copyWith(rankingOverall: res.data, isLoading: false));
        },
        emit: emit,
      );
    }
  }

  Future<void> getRankingStudio(
      GetRankingStudioEvent event, Emitter<IRankingState> emit) async {
    const cacheKey = 'getRankingStudio';

    if (_cache.containsKey(cacheKey) && !_isCacheExpired(_cache[cacheKey]!)) {
      emit((state as RankingSuccess).copyWith(rankingStudio: _cache[cacheKey]!.data, isLoading: false));
    } else {
      await handleRequest(
        request: () async {
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
          _addToCache(cacheKey, res.data);
          emit((state as RankingSuccess)
              .copyWith(rankingStudio: res.data, isLoading: false));
        },
        emit: emit,
      );
    }
  }

  Future<void> getRankingTheSeed(
      GetRankingEvent event, Emitter<IRankingState> emit) async {
    const cacheKey = 'getRankingTheSeed';

    if (_cache.containsKey(cacheKey) && !_isCacheExpired(_cache[cacheKey]!)) {
      emit((state as RankingSuccess).copyWith(rankingTheSeed: _cache[cacheKey]!.data, isLoading: false));
    } else {
      await handleRequest(
        request: () async {
          final params = RankingParams(
            date: event.date,
            worldName: event.worldName,
            ocid: event.ocid,
            page: event.page,
          );

          final res = await _getRankingTheSeedUseCase.execute(params);
          if (res.code != 200) throw Exception('code 200 이 아닙니다.');
          _addToCache(cacheKey, res.data);
          emit((state as RankingSuccess).copyWith(rankingTheSeed: res.data, isLoading: false));
        },
        emit: emit,
      );
    }
  }

  Future<void> getRankingUnion(
      GetRankingEvent event, Emitter<IRankingState> emit) async {
    const cacheKey = 'getRankingUnion';

    if (_cache.containsKey(cacheKey) && !_isCacheExpired(_cache[cacheKey]!)) {
      emit((state as RankingSuccess).copyWith(rankingUnion: _cache[cacheKey]!.data, isLoading: false));
    } else {
      await handleRequest(
        request: () async {
          final params = RankingParams(
            date: event.date,
            worldName: event.worldName,
            ocid: event.ocid,
            page: event.page,
          );

          final res = await _getRankingUnionUseCase.execute(params);
          if (res.code != 200) throw Exception('code 200 이 아닙니다.');
          _addToCache(cacheKey, res.data);
          emit((state as RankingSuccess).copyWith(rankingUnion: res.data,isLoading: false));
        },
        emit: emit,
      );
    }
  }
}
