import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/presentation/all/notice/bloc/notice_event.dart';
import 'package:maple_story_book/app/presentation/all/notice/bloc/notice_state.dart';

///
/// @Project name    : maple_story_book
/// @Class           : notice_extension.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 30..
/// Description      :
///

mixin NoticeBlocMixin on Bloc<INoticeEvent, INoticeState> {
  void emitLoading(Emitter<INoticeState> emit) {
    if (state is NoticeSuccess) {
      emit((state as NoticeSuccess).copyWith(isLoading: true));
    } else {
      emit(NoticeSuccess(isLoading: true));
    }
  }

  void emitError(dynamic error, StackTrace? stackTrace, Emitter<INoticeState> emit) {
    emit(NoticeError(error: error, stackTrace: stackTrace));
  }

  Future<void> handleRequest({
    required Future<void> Function() request,
    required Emitter<INoticeState> emit,
  }) async {
    emitLoading(emit);
    try {
      await request();
    } catch (e, s) {
      emitError(e, s, emit);
    }
  }
}

