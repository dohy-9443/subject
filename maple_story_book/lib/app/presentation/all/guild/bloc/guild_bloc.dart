import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/use_case/use_case.dart';
import 'package:maple_story_book/app/presentation/all/guild/bloc/guild_event.dart';
import 'package:maple_story_book/app/presentation/all/guild/bloc/guild_state.dart';
import 'package:maple_story_book/app/presentation/all/guild/extension/guild_extension.dart';

///
/// @Project name    : maple_story_book
/// @Class           : guild_bloc.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 30..
/// Description      : 
///

@lazySingleton
class GuildBloc extends Bloc<IGuildEvent, IGuildState> with GuildBlocMixin {
  final GetGuildIdUseCase _getGuildIdUseCase;
  final GetGuildBasicUseCase _getGuildBasicUseCase;

  GuildBloc(this._getGuildIdUseCase, this._getGuildBasicUseCase) : super(GuildInitial()) {
    on<GetGuildIdEvent>(getGuildId);
    on<GetGuildBasicEvent>(getGuildBasicInfo);
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

  Future<void> getGuildId(GetGuildIdEvent event, Emitter<IGuildState> emit) async {
    const cacheKey = 'getGuildId';

    if (_cache.containsKey(cacheKey) && !_isCacheExpired(_cache[cacheKey]!)) {
      emit((state as GuildSuccess).copyWith(guildId: _cache[cacheKey]!.data, isLoading: false));
    } else {
      await handleRequest(
        request: () async {
          final params = GuildIdParams(
            guildName: event.guildName,
            worldName: event.worldName,
          );
          final res = await _getGuildIdUseCase.execute(params);
          if (res.code != 200) throw Exception('code 200 이 아닙니다.');
          _addToCache(cacheKey, res.data);
          emit((state as GuildSuccess).copyWith(guildId: res.data, isLoading: false));
        },
        emit: emit,
      );
    }
  }

  Future<void> getGuildBasicInfo(GetGuildBasicEvent event, Emitter<IGuildState> emit) async {
    const cacheKey = 'getGuildBasicInfo';

    if (_cache.containsKey(cacheKey) && !_isCacheExpired(_cache[cacheKey]!)) {
      print("여긴가?");
      emit((state as GuildSuccess).copyWith(guildBasicInfo: _cache[cacheKey]!.data, isLoading: false));
    } else {
      await handleRequest(
        request: () async {
          final params = GuildBasicParams(
            oGuildId: event.oGuildId,
            date: event.date,
          );
          final res = await _getGuildBasicUseCase.execute(params);
          if (res.code != 200) throw Exception('code 200 이 아닙니다.');
          _addToCache(cacheKey, res.data);
          emit((state as GuildSuccess).copyWith(guildBasicInfo: res.data, isLoading: false));
        },
        emit: emit,
      );
    }
  }
}