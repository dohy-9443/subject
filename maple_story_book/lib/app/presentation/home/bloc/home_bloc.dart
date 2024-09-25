import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/app/presentation/global/global_event.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_event.dart';
import 'package:maple_story_book/core/util/bloc/bloc.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_bloc.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 26..
/// Description      : 
///

class HomeBloc extends Bloc<IHomeEvent, IMSState> {
  final ICharacterRepository _characterRepository;

  HomeBloc(this._characterRepository) : super(const InitialState()) {
    on<GetAbilityEvent>(getAbility as EventHandler<GetAbilityEvent, IMSState>);
    on<GetOcIdEvent>(getOcid as EventHandler<GetOcIdEvent, IMSState>);
  }

  Future<void> getAbility(GetAbilityEvent event, Emitter<IMSState<Ability>> emit) async {
    emit(const LoadingState<Ability>());

    try {
      final res = await _characterRepository.getCharacterAbility(ocid: event.ocid, date: event.date);

      if (res.code != 200) throw Exception('code 200 이 아닙니다.');

      emit(DataState<Ability>(data: res.data));

    } catch (e, s) {
      emit(ErrorState<Ability>(error: e, stackTrace: s));
    }
  }

  Future<void> getOcid(GetOcIdEvent event, Emitter<IMSState<Ocid>> emit) async {
    try {
      emit(const LoadingState<Ocid>());

      final res = await _characterRepository.getOcid(
          characterName: event.characterName);

      emit(DataState<Ocid>(data: res.data));
    } catch (e, s) {
      emit(ErrorState<Ocid>(error: e, stackTrace: s));
    }
  }
}

