import 'package:flutter_bloc/flutter_bloc.dart';
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
  void emitLoading(Emitter<RankingState> emit) {
    emit(const RankingState.loading());
  }

  void emitError(dynamic error, StackTrace? stackTrace, Emitter<RankingState> emit) {
    emit(const RankingState.error());
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

}

