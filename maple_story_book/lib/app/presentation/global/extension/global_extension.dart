import 'package:bloc/bloc.dart';
import 'package:maple_story_book/app/presentation/global/global_event.dart';
import 'package:maple_story_book/app/presentation/global/global_state.dart';

mixin GlobalMixin on Bloc<IGlobalEvent, IGlobalState> {
  void emitLoading(Emitter<IGlobalState> emit) {
    if (state is GlobalSuccess) {
      emit((state as GlobalSuccess).copyWith(isLoading: true));
    } else {
      emit(GlobalSuccess(isLoading: true));
    }
  }

  void emitError(dynamic error, StackTrace? stackTrace, Emitter<IGlobalState> emit) {
    emit(GlobalError(error: error, stackTrace: stackTrace));
  }

  Future<void> handleRequest({
    required Future<void> Function() request,
    required Emitter<IGlobalState> emit,
  }) async {
    emitLoading(emit);
    try {
      await request();
    } catch (e, s) {
      emitError(e, s, emit);
    }
  }
}