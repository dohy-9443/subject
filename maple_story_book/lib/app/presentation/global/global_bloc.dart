import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/use_case/use_case.dart';
import 'package:maple_story_book/app/presentation/global/extension/global_extension.dart';
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
class GlobalBloc extends Bloc<GlobalEvent, GlobalState> with GlobalMixin {
  final GetOcidUseCase _getOcidUseCase;
  final GetHistoryUseCase _getHistoryUseCase;
  final RemoveEntryUseCase _removeEntryUseCase;
  final SaveHistoryUseCase _saveHistoryUseCase;
  final GetCharacterBasicUseCase _getCharacterBasicUseCase;

  GlobalSuccess? globalSuccess;

  GlobalBloc(
    this._getOcidUseCase,
    this._getHistoryUseCase,
    this._removeEntryUseCase,
    this._saveHistoryUseCase,
    this._getCharacterBasicUseCase,
  ) : super(const GlobalState.initial()) {
    on<GetOcIdEvent>(getOcid);
    on<GetOcIdListEvent>(getOcIdList);
    on<AddFavoriteEvent>(addFavoriteEvent);
    on<AddSearchEvent>(addSearch);
    on<RemoveFavoriteEvent>(removeFavorite);
    on<LoadFavoritesEvent>(loadFavorites);
    on<LoadSearchesEvent>(loadSearches);
    on<GetBasicInfoEvent>(getCharacterBasic);
  }

  Future<void> getCharacterBasic(GetBasicInfoEvent event, Emitter<GlobalState> emit) async {
    await fetchData<BasicInfo>(
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getCharacterBasicUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('Ability data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) {
        state.emitSuccess(
          emit,
          globalSuccess,
          basicInfo: data,
          isLoading: false,
        );
      },
    );
  }

  Future<void> addFavoriteEvent(AddFavoriteEvent event, Emitter<GlobalState> emit) async {
    await fetchData<List<LocalStorageModel>>(
      fetchFunction: () async {
        final saveParams = SaveHistoryParams(
          category: 'favorite',
          entry: LocalStorageModel(nickName: event.nickName, ocid: event.ocid),
        );
        final getParams = GetHistoryParams(category: 'favorite');
        await _saveHistoryUseCase.execute(saveParams);
        final res = await _getHistoryUseCase.execute(getParams);
        return res;
      },
      emit: emit,
      onSuccess: (data) {
        state.emitSuccess(
          emit,
          globalSuccess,
          favorites: data,
          isLoading: false,
        );
      },
    );
  }

  Future<void> addSearch(AddSearchEvent event, Emitter<GlobalState> emit) async {
    await fetchData<List<LocalStorageModel>>(
      fetchFunction: () async {
        final saveParams = SaveHistoryParams(
          category: 'search',
          entry: LocalStorageModel(nickName: event.nickName, ocid: event.ocid),
        );
        final getParams = GetHistoryParams(category: 'search');
        await _saveHistoryUseCase.execute(saveParams);
        final res = await _getHistoryUseCase.execute(getParams);
        return res;
      },
      emit: emit,
      onSuccess: (data) {
        state.emitSuccess(
          emit,
          globalSuccess,
          searches: data,
          isLoading: false,
        );
      },
    );
  }

  Future<void> removeFavorite(RemoveFavoriteEvent event, Emitter<GlobalState> emit) async {
    await fetchData<List<LocalStorageModel>>(
      fetchFunction: () async {
        final removeParams = RemoveEntryParams(
          category: 'favorite',
          nickname: event.nickName,
        );
        final getParams = GetHistoryParams(category: 'favorite');
        await _removeEntryUseCase.execute(removeParams);
        final res = await _getHistoryUseCase.execute(getParams);
        return res;
      },
      emit: emit,
      onSuccess: (data) {
        state.emitSuccess(
          emit,
          globalSuccess,
          favorites: data,
          isLoading: false,
        );
      },
    );
  }

  Future<void> loadFavorites(LoadFavoritesEvent event, Emitter<GlobalState> emit) async {
    await fetchData<List<LocalStorageModel>>(
      fetchFunction: () async {
        final params = GetHistoryParams(category: 'favorite');
        final res = await _getHistoryUseCase.execute(params);
        return res;
      },
      emit: emit,
      onSuccess: (data) {
        state.emitSuccess(
          emit,
          globalSuccess,
          favorites: data,
          isLoading: false,
        );
      },
    );
  }

  Future<void> loadSearches(LoadSearchesEvent event, Emitter<GlobalState> emit) async {
    await fetchData<List<LocalStorageModel>>(
      fetchFunction: () async {
        final params = GetHistoryParams(category: 'search');
        final res = await _getHistoryUseCase.execute(params);
        return res;
      },
      emit: emit,
      onSuccess: (data) {
        state.emitSuccess(
          emit,
          globalSuccess,
          searches: data,
          isLoading: false,
        );
      },
    );
  }

  // 단일 ocId 요청
  Future<void> getOcid(GetOcIdEvent event, Emitter<GlobalState> emit) async {
    await fetchData<Ocid>(
      fetchFunction: () async {

        final params = GetOcidParams(characterName: event.characterName);
        final res = await _getOcidUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('Ocid data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) {
        state.emitSuccess(
          emit,
          globalSuccess,
          ocid: data,
          isLoading: false,
        );
      },
    );
  }

  // 다중 ocId 요청
  Future<void> getOcIdList(GetOcIdListEvent event, Emitter<GlobalState> emit) async {
    await fetchData<List<Ocid>>(
      fetchFunction: () async {
        final List<Ocid> ocIds = [];

        for (var characterName in event.characterNameList) {
          final params = GetOcidParams(characterName: characterName);
          final res = await _getOcidUseCase.execute(params);

          if (res.code != 200) throw Exception('code 200 이 아닙니다.');
          if (res.data == null) throw Exception('Ocid data is null');
          ocIds.add(res.data as Ocid);
        }
        return ocIds;
      },
      emit: emit,
      onSuccess: (data) {
        state.emitSuccess(
          emit,
          globalSuccess,
          rankerOcId: data,
          isLoading: false,
        );
      },
    );
  }
}
