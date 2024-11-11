import 'package:bloc/bloc.dart';
import 'package:maple_story_book/app/presentation/global/global_event.dart';
import 'package:maple_story_book/app/presentation/global/global_state.dart';

mixin GlobalMixin on Bloc<GlobalEvent, GlobalState> {
  void emitLoading(Emitter<GlobalState> emit) {
    emit(const GlobalState.loading());
  }

  void emitError(dynamic error, StackTrace? stackTrace, Emitter<GlobalState> emit) {
    emit(const GlobalState.error());
  }

  Future<void> handleRequest({
    required Future<void> Function() request,
    required Emitter<GlobalState> emit,
  }) async {
    emitLoading(emit);
    try {
      await request();
    } catch (e, s) {
      emitError(e, s, emit);
    }
  }
}