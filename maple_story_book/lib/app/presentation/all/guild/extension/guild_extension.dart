import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/presentation/all/guild/bloc/guild_event.dart';
import 'package:maple_story_book/app/presentation/all/guild/bloc/guild_state.dart';

///
/// @Project name    : maple_story_book
/// @Class           : guild_bloc_mixin.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 30..
/// Description      : 
///

mixin GuildBlocMixin on Bloc<IGuildEvent, IGuildState> {
  void emitLoading(Emitter<IGuildState> emit) {
    if (state is GuildSuccess) {
      emit((state as GuildSuccess).copyWith(isLoading: true));
    } else {
      emit(GuildSuccess(isLoading: true));
    }
  }

  void emitError(dynamic error, StackTrace? stackTrace, Emitter<IGuildState> emit) {
    emit(GuildError(error: error, stackTrace: stackTrace));
  }

  Future<void> handleRequest({
    required Future<void> Function() request,
    required Emitter<IGuildState> emit,
  }) async {
    emitLoading(emit);
    try {
      await request();
    } catch (e, s) {
      emitError(e, s, emit);
    }
  }
}