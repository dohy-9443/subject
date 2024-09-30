
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/presentation/all/potential/bloc/potential_event.dart';
import 'package:maple_story_book/app/presentation/all/potential/bloc/potential_state.dart';

///
/// @Project name    : maple_story_book
/// @Class           : potential_extension.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 30..
/// Description      : 
///

mixin PotentialBlocMixin on Bloc<IPotentialEvent, IPotentialState> {
  void emitLoading(Emitter<IPotentialState> emit) {
    if (state is PotentialSuccess) {
      emit((state as PotentialSuccess).copyWith(isLoading: true));
    } else {
      emit(PotentialSuccess(isLoading: true));
    }
  }

  void emitError(dynamic error, StackTrace? stackTrace, Emitter<IPotentialState> emit) {
    emit(PotentialError(error: error, stackTrace: stackTrace));
  }

  Future<void> handleRequest({
    required Future<void> Function() request,
    required Emitter<IPotentialState> emit,
  }) async {
    emitLoading(emit);
    try {
      await request();
    } catch (e, s) {
      emitError(e, s, emit);
    }
  }
}