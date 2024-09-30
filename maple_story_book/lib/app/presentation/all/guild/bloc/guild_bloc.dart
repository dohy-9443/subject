import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
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

  Future<void> getGuildId(GetGuildIdEvent event, Emitter<IGuildState> emit) async {
    await handleRequest(
      request: () async {
        final params = GuildIdParams(
          guildName: event.guildName,
          worldName: event.worldName,
        );
        final res = await _getGuildIdUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as GuildSuccess).copyWith(guildId: res.data, isLoading: false));
      },
      emit: emit,
    );
  }

  Future<void> getGuildBasicInfo(GetGuildBasicEvent event, Emitter<IGuildState> emit) async {
    await handleRequest(
      request: () async {
        final params = GuildBasicParams(
          oGuildId: event.oGuildId,
          date: event.date,
        );
        final res = await _getGuildBasicUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as GuildSuccess).copyWith(guildBasicInfo: res.data, isLoading: false));
      },
      emit: emit,
    );
  }
}