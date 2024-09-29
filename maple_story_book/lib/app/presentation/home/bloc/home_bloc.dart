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
  final GetItemEquipmentUseCase _getItemEquipmentUseCase;

  HomeBloc(
    this._getAbilityUseCase,
    this._getCharacterBasicUseCase,
    this._getItemEquipmentUseCase,
  ) : super(HomeInitial()) {
    on<GetHomeEvent>(getAbility);
    on<GetHomeEvent>(getCharacterBasic);
    on<GetHomeEvent>(getItemEquipment);
  }

  Future<void> getAbility(GetHomeEvent event, Emitter<IHomeState> emit) async {
    // loading 처리
    if (state is HomeSuccess) {
      emit((state as HomeSuccess).copyWith(isLoading: true));
    } else {
      emit(HomeSuccess(isLoading: true));
    }

    try {
      final res = await _getAbilityUseCase.execute();

      if (res.code != 200) throw Exception('code 200 이 아닙니다.');

      emit((state as HomeSuccess).copyWith(ability: res.data, isLoading: false));

    } catch (e, s) {
      emit(HomeError(error: e, stackTrace: s));
    }
  }

  Future<void> getCharacterBasic(GetHomeEvent event, Emitter<IHomeState> emit) async {
    // loading 처리
    if (state is HomeSuccess) {
      emit((state as HomeSuccess).copyWith(isLoading: true));
    } else {
      emit(HomeSuccess(isLoading: true));
    }

    try {
      final res = await _getCharacterBasicUseCase.execute();

      if (res.code != 200) throw Exception('code 200 이 아닙니다.');

      emit((state as HomeSuccess).copyWith(basicInfo: res.data, isLoading: false));
    } catch (e, s) {
      emit(HomeError(error: e, stackTrace: s));
    }
  }

  Future<void> getItemEquipment(GetHomeEvent event, Emitter<IHomeState> emit) async {
    // loading 처리
    if (state is HomeSuccess) {
      emit((state as HomeSuccess).copyWith(isLoading: true));
    } else {
      emit(HomeSuccess(isLoading: true));
    }

    try {
      final res = await _getItemEquipmentUseCase.execute();

      if (res.code != 200) throw Exception('code 200 이 아닙니다.');

      emit((state as HomeSuccess).copyWith(itemEquipment: res.data, isLoading: false));
    } catch (e, s) {
      emit(HomeError(error: e, stackTrace: s));
    }
  }
}
