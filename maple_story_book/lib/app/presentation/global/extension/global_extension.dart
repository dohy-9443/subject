import 'package:bloc/bloc.dart';
import 'package:maple_story_book/app/data/source/model/model.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/global/global_event.dart';
import 'package:maple_story_book/app/presentation/global/global_state.dart';

mixin GlobalMixin on Bloc<GlobalEvent, GlobalState> {
  void emitLoading(Emitter<GlobalState> emit) {
    if (state is GlobalSuccess) {
      emit((state as GlobalSuccess).copyWith(isLoading: true));
    } else {
      emit(const GlobalState.success(
        ocid: Ocid(),
        searches: [],
        favorites: [],
        rankerOcId: [],
        date: null,
        characterName: '',
        worldName: '',
        characterGender: '',
        characterClass: '',
        characterClassLevel: 0,
        characterLevel: 0,
        characterExp: '',
        characterExpRate: '',
        characterGuildName: '',
        characterImage: '',
        characterDateCreate: '',
        accessFlag: false,
        liberationQuestClearFlag: false,
        basicInfo: BasicInfo(),
        isLoading: true,
      ));
    }
  }

  void emitError(dynamic error, StackTrace? stackTrace, Emitter<GlobalState> emit) {
    print("ERROR : $error");
    emit(const GlobalState.error(errorMessage: ''));
  }

  Future<void> handleRequest({
    required Future<void> Function() request,
    required Emitter<GlobalState> emit,
  }) async {
    emitLoading(emit);
    try {
      await request();
    } catch (e, s) {
      emitError(e, s, emit);
    }
  }

  Future<void> fetchData<T>({
    required Future<T> Function() fetchFunction,
    required Emitter<GlobalState> emit,
    required void Function(T) onSuccess,
  }) async {
    await handleRequest(
      request: () async {
        final data = await fetchFunction();
        onSuccess(data);
      },
      emit: emit,
    );
  }
}

extension HomeBlocExtension on GlobalState {
  void emitSuccess(
      Emitter<GlobalState> emit, {
        Ocid? ocid,
        List<LocalStorageModel>? searches,
        List<LocalStorageModel>? favorites,
        List<Ocid>? rankerOcId,
        DateTime? date,
        String? characterName,
        String? worldName,
        String? characterGender,
        String? characterClass,
        int? characterClassLevel,
        int? characterLevel,
        String? characterExp,
        String? characterExpRate,
        String? characterGuildName,
        String? characterImage,
        String? characterDateCreate,
        bool? accessFlag,
        bool? liberationQuestClearFlag,
        BasicInfo? basicInfo,
        bool isLoading = false,
      }) {
    if (this is GlobalSuccess) {
      emit(
        (this as GlobalSuccess).copyWith(
          ocid: ocid ?? (this as GlobalSuccess).ocid,
          searches: searches ?? (this as GlobalSuccess).searches,
          favorites: favorites ?? (this as GlobalSuccess).favorites,
          rankerOcId: rankerOcId ?? (this as GlobalSuccess).rankerOcId,
          date: date ?? (this as GlobalSuccess).date,
          characterName: characterName ?? (this as GlobalSuccess).characterName,
          worldName: worldName ?? (this as GlobalSuccess).worldName,
          characterGender: characterGender ?? (this as GlobalSuccess).characterGender,
          characterClass: characterClass ?? (this as GlobalSuccess).characterClass,
          characterClassLevel: characterClassLevel ?? (this as GlobalSuccess).characterClassLevel,
          characterLevel: characterLevel ?? (this as GlobalSuccess).characterLevel,
          characterExp: characterExp ?? (this as GlobalSuccess).characterExp,
          characterExpRate: characterExpRate ?? (this as GlobalSuccess).characterExpRate,
          characterGuildName: characterGuildName ?? (this as GlobalSuccess).characterGuildName,
          characterImage: characterImage ?? (this as GlobalSuccess).characterImage,
          characterDateCreate: characterDateCreate ?? (this as GlobalSuccess).characterDateCreate,
          accessFlag: accessFlag ?? (this as GlobalSuccess).accessFlag,
          liberationQuestClearFlag: liberationQuestClearFlag ?? (this as GlobalSuccess).liberationQuestClearFlag,
          basicInfo: basicInfo ?? (this as GlobalSuccess).basicInfo,
          isLoading: isLoading,
        ),
      );
    } else {
      emit(GlobalState.success(
        ocid: ocid ?? const Ocid(),
        searches: searches ?? [],
        favorites: favorites ?? [],
        rankerOcId: rankerOcId ?? [],
        date: date,
        characterName: '',
        worldName: worldName ?? '',
        characterGender: characterGender ?? '',
        characterClass: characterClass ?? '',
        characterClassLevel: characterClassLevel ?? 0,
        characterLevel: characterLevel ?? 0,
        characterExp: characterExp ?? '',
        characterExpRate: characterExpRate ?? '',
        characterGuildName: characterGuildName ?? '',
        characterImage: characterImage ?? '',
        characterDateCreate: characterDateCreate ?? '',
        accessFlag: accessFlag ?? false,
        liberationQuestClearFlag: liberationQuestClearFlag ?? false,
        basicInfo: basicInfo ?? const BasicInfo(),
        isLoading: isLoading,
      ));
    }
  }
}
