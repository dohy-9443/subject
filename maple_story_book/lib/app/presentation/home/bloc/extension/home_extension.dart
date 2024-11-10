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

// mixin HomeBlocMixin on Bloc<IHomeEvent, IHomeState> {
//   void emitLoading(Emitter<IHomeState> emit) {
//     if (state is HomeSuccess) {
//       emit((state as HomeSuccess).copyWith(isLoading: true));
//     } else {
//       emit(HomeSuccess(isLoading: true));
//     }
//   }
//
//   void emitError(dynamic error, StackTrace? stackTrace, Emitter<IHomeState> emit) {
//     emit(HomeError(error: error, stackTrace: stackTrace));
//   }
//
//   Future<void> handleRequest({
//     required Future<void> Function() request,
//     required Emitter<IHomeState> emit,
//   }) async {
//     emitLoading(emit);
//     try {
//       await request();
//     } catch (e, s) {
//       emitError(e, s, emit);
//     }
//   }
// }

mixin HomeBlocMixin on Bloc<HomeEvent, HomeState> {
  void emitLoading(Emitter<HomeState> emit) {
    emit(const HomeState.loading());
  }

  void emitError(dynamic error, StackTrace? stackTrace, Emitter<HomeState> emit) {
    emit(HomeState.error());
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