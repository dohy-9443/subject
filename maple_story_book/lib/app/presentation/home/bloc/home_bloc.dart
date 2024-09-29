import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/domain/use_case/use_case.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_event.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_state.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_bloc.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 26..
/// Description      :
///

@singleton
class HomeBloc extends Bloc<IHomeEvent, IHomeState> {
  final GetAbilityUseCase _getAbilityUseCase;
  final GetCharacterBasicUseCase _getCharacterBasicUseCase;

  HomeBloc(
    this._getAbilityUseCase,
    this._getCharacterBasicUseCase,
  ) : super(const HomeInitial()) {
    on<GetHomeEvent>(getAbility);
    on<GetHomeEvent>(getCharacterBasic);
  }

  Future<void> getAbility(GetHomeEvent event, Emitter<IHomeState> emit) async {
    emit(HomeLoading(
      ocid: state.ocid,
      ability: state.ability,
      basicInfo: state.basicInfo,
    ));

    try {
      final res = await _getAbilityUseCase.execute();

      if (res.code != 200) throw Exception('code 200 이 아닙니다.');

      emit(HomeSuccess(ocid: state.ocid, ability: res.data, basicInfo: state.basicInfo));
    } catch (e, s) {
      emit(HomeError(error: e, stackTrace: s));
    }
  }

  Future<void> getCharacterBasic(GetHomeEvent event, Emitter<IHomeState> emit) async {
    emit(HomeLoading(
      ocid: state.ocid,
      ability: state.ability,
      basicInfo: state.basicInfo,
    ));

    try {
      final res = await _getCharacterBasicUseCase.execute();

      if (res.code != 200) throw Exception('code 200 이 아닙니다.');

      emit(HomeSuccess(ocid: state.ocid, ability: state.ability, basicInfo: res.data));
    } catch (e, s) {
      emit(HomeError(error: e, stackTrace: s));
    }
  }
}
