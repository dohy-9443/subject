import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/core/util/bloc/bloc.dart';

///
/// @Project name    : maple_story_book
/// @Class           : maple_story_bloc.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 25..
/// Description      : 
///

class IMSBloc<T, Params> extends Bloc<IMSEvent, IMSState<T>> {
  final Future<T> Function(Params params) useCase;

  IMSBloc({required this.useCase}) : super(const InitialState()) {
    on<MSEvent<Params>>((event, emit) async {
      emit(LoadingState());

      try {
        final result = await useCase(event.params);

        if (result == null) return emit(EmptyState());
        emit(DataState(data: result, updatedAt: DateTime.now()));
      } catch (error, stackTrace) {
        emit(ErrorState(error: error, stackTrace: stackTrace));
      }
    });
  }
}