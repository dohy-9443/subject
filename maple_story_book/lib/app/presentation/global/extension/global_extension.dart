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
      Emitter<GlobalState> emit,
      GlobalSuccess? globalSuccess, {
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
      }) async {
    try {
      globalSuccess = globalSuccess ?? const GlobalSuccess();

      globalSuccess = globalSuccess.copyWith(
        ocid: ocid ?? globalSuccess.ocid,
        searches: searches ?? globalSuccess.searches,
        favorites: favorites ?? globalSuccess.favorites,
        rankerOcId: rankerOcId ?? globalSuccess.rankerOcId,
        date: date ?? globalSuccess.date,
        characterName: characterName ?? globalSuccess.characterName,
        worldName: worldName ?? globalSuccess.worldName,
        characterGender: characterGender ?? globalSuccess.characterGender,
        characterClass: characterClass ?? globalSuccess.characterClass,
        characterClassLevel: characterClassLevel ?? globalSuccess.characterClassLevel,
        characterLevel: characterLevel ?? globalSuccess.characterLevel,
        characterExp: characterExp ?? globalSuccess.characterExp,
        characterExpRate: characterExpRate ?? globalSuccess.characterExpRate,
        characterGuildName: characterGuildName ?? globalSuccess.characterGuildName,
        characterImage: characterImage ?? globalSuccess.characterImage,
        characterDateCreate: characterDateCreate ?? globalSuccess.characterDateCreate,
        accessFlag: accessFlag ?? globalSuccess.accessFlag,
        liberationQuestClearFlag: liberationQuestClearFlag ?? globalSuccess.liberationQuestClearFlag,
        basicInfo: basicInfo ?? globalSuccess.basicInfo,
        isLoading: isLoading,
      );
      emit(globalSuccess);
    } catch (e) {
      print("Error in emitSuccess: $e");
    }
  }
}
