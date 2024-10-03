import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/domain/use_case/character/character.dart';
import 'package:maple_story_book/app/presentation/global/global_event.dart';
import 'package:maple_story_book/app/presentation/global/global_state.dart';

///
/// @Project name    : maple_story_book
/// @Class           : global.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 26..
/// Description      :
///
///

@singleton
class GlobalBloc extends Bloc<IGlobalEvent, IGlobalState> {
  final GetOcidUseCase _getOcidUseCase;

  GlobalBloc(this._getOcidUseCase) : super(GlobalInitial()) {
    on<GetOcIdEvent>(getOcid);
  }

  Future<void> getOcid(GetOcIdEvent event, Emitter<IGlobalState> emit) async {
    if (state is GlobalSuccess) {
      emit((state as GlobalSuccess).copyWith(isLoading: true));
    } else {
      emit(GlobalSuccess(isLoading: true));
    }
    try {
      final params = GetOcidParams(characterName: event.characterName,);

      final res = await _getOcidUseCase.execute(params);
      if (res.code != 200) throw Exception('code 200 이 아닙니다.');
      emit((state as GlobalSuccess).copyWith(ocid: res.data, isLoading: false));

    } catch (e, s) {
      emit(GlobalError(error: e, stackTrace: s));
    }
  }
}
