import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_event.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_state.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_extension.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 29..
/// Description      : 
///

mixin HomeBlocMixin on Bloc<HomeEvent, HomeState> {
  void emitLoading(Emitter<HomeState> emit) {
    emit(const HomeState.loading());
  }

  void emitError(dynamic error, StackTrace? stackTrace, Emitter<HomeState> emit) {
    emit(const HomeState.error());
  }

  Future<void> handleRequest({
    required Future<void> Function() request,
    required Emitter<HomeState> emit,
  }) async {
    emitLoading(emit);
    try {
      await request();
    } catch (e, s) {
      emitError(e, s, emit);
    }
  }
}