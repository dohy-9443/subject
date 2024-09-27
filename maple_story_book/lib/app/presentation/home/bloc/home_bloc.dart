import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
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
  final ICharacterRepository _characterRepository;

  HomeBloc(this._characterRepository) : super(const HomeInitial()) {
    on<GetAbilityEvent>(getAbility);
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

}
