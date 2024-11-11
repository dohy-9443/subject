import 'package:bloc/bloc.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/global/global_event.dart';
import 'package:maple_story_book/app/presentation/global/global_state.dart';

mixin GlobalMixin on Bloc<GlobalEvent, GlobalState> {
  void emitLoading(Emitter<GlobalState> emit) {
    emit(const GlobalState.loading());
  }

  void emitError(dynamic error, StackTrace? stackTrace, Emitter<GlobalState> emit) {
    print("ERROR : $error");
    emit(const GlobalState.error(errorMessage: ''));
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

  Future<void> fetchData<T>({
    required Future<T> Function() fetchFunction,
    required Emitter<GlobalState> emit,
    required void Function(T) onSuccess,
  }) async {
    emit(const GlobalState.loading());
    await handleRequest(
      request: () async {
        final data = await fetchFunction();
        onSuccess(data);
      },
      emit: emit,
    );
  }
}