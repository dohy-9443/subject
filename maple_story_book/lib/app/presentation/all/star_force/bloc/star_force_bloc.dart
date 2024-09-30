import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/use_case/use_case.dart';
import 'package:maple_story_book/app/presentation/all/star_force/bloc/star_force_event.dart';
import 'package:maple_story_book/app/presentation/all/star_force/bloc/star_force_state.dart';

///
/// @Project name    : maple_story_book
/// @Class           : starForce_bloc.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 30..
/// Description      : 
///

@lazySingleton
class StarForceBloc extends Bloc<IStarForceEvent, IStarForceState> {
  final GetHistoryStarForceUseCase _getHistoryStarForceUseCase;

  StarForceBloc(this._getHistoryStarForceUseCase,) : super(StarForceInitial()) {
    on<GetStarForceEvent>(getStarForceHistory);
  }

  Future<void> getStarForceHistory(GetStarForceEvent event, Emitter<IStarForceState> emit) async {
    if (state is StarForceSuccess) {
      emit((state as StarForceSuccess).copyWith(isLoading: true));
    } else {
      emit(StarForceSuccess(isLoading: true));
    }
    try {
      final params = PotentialParams(
        count: event.count,
        date: event.date,
        cursor: event.cursor,
      );
      final res = await _getHistoryStarForceUseCase.execute(params);
      if (res.code != 200) throw Exception('code 200 이 아닙니다.');
      emit((state as StarForceSuccess).copyWith(starForceHistory: res.data, isLoading: false));
    } catch (e, s) {
      emit(StarForceError(error: e, stackTrace: s));
    }
  }
}