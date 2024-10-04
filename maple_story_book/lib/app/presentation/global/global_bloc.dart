import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/use_case/use_case.dart';
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
  final DeleteHistoryUseCase _deleteHistoryUseCase;
  final GetHistoryUseCase _getHistoryUseCase;
  final RemoveEntryUseCase _removeEntryUseCase;
  final SaveHistoryUseCase _saveHistoryUseCase;

  GlobalBloc(
    this._getOcidUseCase,
    this._deleteHistoryUseCase,
    this._getHistoryUseCase,
    this._removeEntryUseCase,
    this._saveHistoryUseCase,
  ) : super(GlobalInitial()) {
    on<GetOcIdEvent>(getOcid);
    on<AddFavoriteEvent>(addFavoriteEvent);
    on<AddSearchEvent>(addSearch);
    on<RemoveFavoriteEvent>(removeFavorite);
    on<LoadFavoritesEvent>(loadFavorites);
    on<LoadSearchesEvent>(loadSearches);
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

  Future<void> addFavoriteEvent(AddFavoriteEvent event, Emitter<IGlobalState> emit) async {
    if (state is GlobalSuccess) {
      emit((state as GlobalSuccess).copyWith(isLoading: true));
    } else {
      emit(GlobalSuccess(isLoading: true));
    }

    try {
      final saveParams = SaveHistoryParams(
        category: 'favorite',
        entry: LocalStorageModel(nickName: event.nickName, ocid: event.ocid),
      );

      final getParams = GetHistoryParams(category: 'favorite');

      await _saveHistoryUseCase.execute(saveParams);

      final updatedFavorites = await _getHistoryUseCase.execute(getParams);
      emit((state as GlobalSuccess).copyWith(favorites: updatedFavorites, isLoading: false));

    } catch (e, s) {
      emit(GlobalError(error: e, stackTrace: s));
    }
  }

  Future<void> addSearch(AddSearchEvent event, Emitter<IGlobalState> emit) async {
    if (state is GlobalSuccess) {
      emit((state as GlobalSuccess).copyWith(isLoading: true));
    } else {
      emit(GlobalSuccess(isLoading: true));
    }

    try {
      final saveParams = SaveHistoryParams(
        category: 'search',
        entry: LocalStorageModel(nickName: event.nickName, ocid: event.ocid),
      );

      final getParams = GetHistoryParams(category: 'search');

      await _saveHistoryUseCase.execute(saveParams);
      final updatedSearches = await _getHistoryUseCase.execute(getParams);
      emit((state as GlobalSuccess).copyWith(searches: updatedSearches, isLoading: false));

    } catch (e, s) {
      emit(GlobalError(error: e, stackTrace: s));
    }
  }

  Future<void> removeFavorite(RemoveFavoriteEvent event, Emitter<IGlobalState> emit) async {
    if (state is GlobalSuccess) {
      emit((state as GlobalSuccess).copyWith(isLoading: true));
    } else {
      emit(GlobalSuccess(isLoading: true));
    }

    try {
      final removeParams = RemoveEntryParams(
        category: 'favorite',
        nickname: event.nickName,
      );

      final getParams = GetHistoryParams(category: 'favorite');

      await _removeEntryUseCase.execute(removeParams);
      final updatedFavorites = await _getHistoryUseCase.execute(getParams);
      emit((state as GlobalSuccess).copyWith(favorites: updatedFavorites, isLoading: false));

    } catch (e, s) {
      emit(GlobalError(error: e, stackTrace: s));
    }
  }

  Future<void> loadFavorites(LoadFavoritesEvent event, Emitter<IGlobalState> emit) async {
    if (state is GlobalSuccess) {
      emit((state as GlobalSuccess).copyWith(isLoading: true));
    } else {
      emit(GlobalSuccess(isLoading: true));
    }

    try {
      final params = GetHistoryParams(category: 'favorite');

      final favorites = await _getHistoryUseCase.execute(params);
      emit((state as GlobalSuccess).copyWith(favorites: favorites, isLoading: false));

    } catch (e, s) {
      emit(GlobalError(error: e, stackTrace: s));
    }
  }

  Future<void> loadSearches(LoadSearchesEvent event, Emitter<IGlobalState> emit) async {
    if (state is GlobalSuccess) {
      emit((state as GlobalSuccess).copyWith(isLoading: true));
    } else {
      emit(GlobalSuccess(isLoading: true));
    }

    try {
      final params = GetHistoryParams(category: 'search');

      final searches = await _getHistoryUseCase.execute(params);
      emit((state as GlobalSuccess).copyWith(searches: searches, isLoading: false));

    } catch (e, s) {
      emit(GlobalError(error: e, stackTrace: s));
    }
  }
}
