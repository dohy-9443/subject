import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_event.dart';

import 'home_state.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_bloc.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 26..
/// Description      :
///

class HomeBloc extends Bloc<IHomeEvent, IHomeState> {
  final ICharacterRepository _characterRepository;

  HomeBloc(this._characterRepository) : super(const HomeInitial()) {
    on<GetAbilityEvent>(getAbility);
    on<GetOcIdEvent>(getOcid);

    add(GetOcIdEvent('l망치사냥꾼l'));
  }

  Future<void> getAbility(
      GetAbilityEvent event, Emitter<IHomeState> emit) async {
    emit(const HomeLoading());

    try {
      final res = await _characterRepository.getCharacterAbility(
          ocid: event.ocid, date: event.date);

      if (res.code != 200) throw Exception('code 200 이 아닙니다.');

      emit(HomeSuccess(ability: res.data, ocid: state.ocid));
    } catch (e, s) {
      emit(HomeError(error: e, stackTrace: s));
    }
  }

  Future<void> getOcid(GetOcIdEvent event, Emitter<IHomeState> emit) async {
    emit(const HomeLoading());
    try {
      final res = await _characterRepository.getOcid(
          characterName: event.characterName);

      emit(HomeSuccess(ability: state.ability, ocid: res.data));
    } catch (e, s) {
      emit(HomeError(error: e, stackTrace: s));
    }
  }
}
