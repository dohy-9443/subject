import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/app/domain/use_case/character/character.dart';
import 'package:maple_story_book/app/presentation/global/global_event.dart';
import 'package:maple_story_book/core/util/bloc/bloc.dart';

///
/// @Project name    : maple_story_book
/// @Class           : global.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 26..
/// Description      :
///
///

@singleton
class GlobalBloc extends Bloc<IGlobalEvent, IMSState<Ocid>> {
  final GetOcidUseCase _getOcidUseCase;

  GlobalBloc(this._getOcidUseCase) : super(const InitialState<Ocid>()) {
    on<GetOcIdEvent>(getOcid);
  }

  Future<void> getOcid(GetOcIdEvent event, Emitter<IMSState<Ocid>> emit) async {
    try {
      emit(const LoadingState<Ocid>());

      final res = await _getOcidUseCase.execute();

      emit(DataState<Ocid>(data: res.data));
    } catch (e, s) {
      emit(ErrorState<Ocid>(error: e, stackTrace: s));
    }
  }
}
