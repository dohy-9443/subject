import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/bloc/bloc.dart';

import '../../data/source/model/result.dart';
import 'global_event.dart';

@injectable
class GlobalBloc extends Bloc<GlobalEvent, IMSState<Ocid>> {
  final ICharacterRepository _characterRepository;

  GlobalBloc(this._characterRepository) : super(const InitialState<Ocid>()) {
    on<GetOcIdEvent>(getOcid);
  }

  Future<void> getOcid(GetOcIdEvent event, Emitter<IMSState<Ocid>> emit) async {
    try {
      emit(const LoadingState());

      ResultRest<Ocid> res = await _characterRepository.getOcid(
          characterName: event.characterName);

      emit(DataState<Ocid>(data: res.data));
    } catch (e, s) {
      emit(ErrorState<Ocid>(error: e, stackTrace: s));
    }
  }
}
