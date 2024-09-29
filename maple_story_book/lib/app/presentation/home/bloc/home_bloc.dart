import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/domain/use_case/character/get_ability.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_event.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_state.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_bloc.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 26..
/// Description      :
///

@injectable
class HomeBloc extends Bloc<IHomeEvent, IHomeState> {
  final GetAbilityUseCase _getAbilityUseCase;

  HomeBloc(this._getAbilityUseCase) : super(const HomeInitial()) {
    on<GetHomeEvent>(getAbility);
  }

  Future<void> getAbility(
      GetHomeEvent event, Emitter<IHomeState> emit) async {
    emit(const HomeLoading());

    try {
      final res = await _getAbilityUseCase.execute();

      if (res.code != 200) throw Exception('code 200 이 아닙니다.');

      emit(HomeSuccess(ability: res.data, ocid: state.ocid));
    } catch (e, s) {
      emit(HomeError(error: e, stackTrace: s));
    }
  }

}
