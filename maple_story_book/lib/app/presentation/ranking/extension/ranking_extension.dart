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

mixin RankingBlocMixin on Bloc<IRankingEvent, IRankingState> {
  void emitLoading(Emitter<IRankingState> emit) {
    if (state is RankingSuccess) {
      emit((state as RankingSuccess).copyWith(isLoading: true));
    } else {
      emit(RankingSuccess(isLoading: true));
    }
  }

  void emitError(dynamic error, StackTrace? stackTrace, Emitter<IRankingState> emit) {
    emit(RankingError(error: error, stackTrace: stackTrace));
  }

  Future<void> handleRequest({
    required Future<void> Function() request,
    required Emitter<IRankingState> emit,
  }) async {
    emitLoading(emit);
    try {
      await request();
    } catch (e, s) {
      emitError(e, s, emit);
    }
  }

}

