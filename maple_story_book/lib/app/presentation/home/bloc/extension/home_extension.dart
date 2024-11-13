import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maple_story_book/app/data/source/model/model.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_event.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_state.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_extension.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 29..
/// Description      : 
///

mixin HomeBlocMixin on Bloc<HomeEvent, HomeState> {
  static const Duration cacheDuration = Duration(minutes: 10);
  static const int maxCacheSize = 20;

  final Map<String, CacheEntry> _cache = {};
  final List<String> _cacheKeys = [];

  void _addToCache(String key, dynamic data) {
    if (_cacheKeys.length >= maxCacheSize) {
      final oldestKey = _cacheKeys.removeAt(0);
      _cache.remove(oldestKey);
    }
    _cache[key] = CacheEntry(data, DateTime.now());
    _cacheKeys.add(key);
  }

  bool _isCacheExpired(CacheEntry entry) {
    return DateTime.now().difference(entry.cacheTime) > cacheDuration;
  }

  void emitLoading(Emitter<HomeState> emit) {
    if (state is HomeSuccess) {
      emit((state as HomeSuccess).copyWith(isLoading: true));
    } else {
      emit(const HomeState.success(
        ability: Ability(abilityPreset1: AbilityPreset(), abilityPreset2: AbilityPreset(), abilityPreset3: AbilityPreset()),
        propensity: Propensity(),
        popularity: Popularity(),
        itemEquipment: ItemEquipment(),
        cashItemEquipment: CashItemEquipment(),
        setEffect: SetEffect(),
        symbolEquipment: SymbolEquipment(),
        stat: Stat(),
        hyperStat: HyperStat(),
        petEquipment: PetEquipment(),
        beautyEquipment: BeautyEquipment(),
        androidEquipment: AndroidEquipment(),
        skillInfo: SkillInfo(),
        linkSkill: LinkSkill(),
        vMatrixInfo: VMatrixInfo(),
        hexaMatrixInfo: HexaMatrixInfo(),
        hexaMatrixStat: HexaMatrixStat(),
        studioTopRecordInfo: StudioTopRecordInfo(),
        isLoading: true,
      ));
    }
  }

  void emitError(dynamic error, StackTrace? stackTrace, Emitter<HomeState> emit) {
    print('ERROR HOME : $error');
    emit(const HomeState.error(errorMessage: ''));
  }

  Future<void> handleRequest({
    required Future<void> Function() request,
    required Emitter<HomeState> emit,
  }) async {
    emitLoading(emit);
    try {
      await request();
    } catch (e, s) {
      emitError(e, s, emit);
    }
  }

  Future<void> fetchData<T>({
    required String cacheKey,
    required Future<T> Function() fetchFunction,
    required Emitter<HomeState> emit,
    required void Function(T) onSuccess,
  }) async {
    if (_cache.containsKey(cacheKey) && !_isCacheExpired(_cache[cacheKey]!)) {
      final cachedData = _cache[cacheKey]!.data as T;
      onSuccess(cachedData);
    } else {
      await handleRequest(
        request: () async {
          final data = await fetchFunction();
          _addToCache(cacheKey, data);

          onSuccess(data);
        },
        emit: emit,
      );
    }
  }
}

extension HomeBlocExtension on HomeState {
  void emitSuccess(
      Emitter<HomeState> emit, {
        Ability? ability,
        Propensity? propensity,
        Popularity? popularity,
        ItemEquipment? itemEquipment,
        CashItemEquipment? cashItemEquipment,
        SetEffect? setEffect,
        SymbolEquipment? symbolEquipment,
        Stat? stat,
        HyperStat? hyperStat,
        PetEquipment? petEquipment,
        BeautyEquipment? beautyEquipment,
        AndroidEquipment? androidEquipment,
        SkillInfo? skillInfo,
        LinkSkill? linkSkill,
        VMatrixInfo? vMatrixInfo,
        HexaMatrixInfo? hexaMatrixInfo,
        HexaMatrixStat? hexaMatrixStat,
        StudioTopRecordInfo? studioTopRecordInfo,
        bool isLoading = false,
      }) {
    if (this is HomeSuccess) {
      emit(
        (this as HomeSuccess).copyWith(
          ability: ability ?? (this as HomeSuccess).ability,
          propensity: propensity ?? (this as HomeSuccess).propensity,
          popularity: popularity ?? (this as HomeSuccess).popularity,
          itemEquipment: itemEquipment ?? (this as HomeSuccess).itemEquipment,
          cashItemEquipment: cashItemEquipment ?? (this as HomeSuccess).cashItemEquipment,
          setEffect: setEffect ?? (this as HomeSuccess).setEffect,
          symbolEquipment: symbolEquipment ?? (this as HomeSuccess).symbolEquipment,
          stat: stat ?? (this as HomeSuccess).stat,
          hyperStat: hyperStat ?? (this as HomeSuccess).hyperStat,
          petEquipment: petEquipment ?? (this as HomeSuccess).petEquipment,
          beautyEquipment: beautyEquipment ?? (this as HomeSuccess).beautyEquipment,
          androidEquipment: androidEquipment ?? (this as HomeSuccess).androidEquipment,
          skillInfo: skillInfo ?? (this as HomeSuccess).skillInfo,
          linkSkill: linkSkill ?? (this as HomeSuccess).linkSkill,
          vMatrixInfo: vMatrixInfo ?? (this as HomeSuccess).vMatrixInfo,
          hexaMatrixInfo: hexaMatrixInfo ?? (this as HomeSuccess).hexaMatrixInfo,
          hexaMatrixStat: hexaMatrixStat ?? (this as HomeSuccess).hexaMatrixStat,
          studioTopRecordInfo: studioTopRecordInfo ?? (this as HomeSuccess).studioTopRecordInfo,
          isLoading: isLoading,
        ),
      );
    } else {
      emit(HomeState.success(
        ability: ability ?? const Ability(abilityPreset1: AbilityPreset(), abilityPreset2: AbilityPreset(), abilityPreset3: AbilityPreset()),
        propensity: propensity ?? const Propensity(),
        popularity: popularity ?? const Popularity(),
        itemEquipment: itemEquipment ?? const ItemEquipment(),
        cashItemEquipment: cashItemEquipment ?? const CashItemEquipment(),
        setEffect: setEffect ?? const SetEffect(),
        symbolEquipment: symbolEquipment ?? const SymbolEquipment(),
        stat: stat ?? const Stat(),
        hyperStat: hyperStat ?? const HyperStat(),
        petEquipment: petEquipment ?? const PetEquipment(),
        beautyEquipment: beautyEquipment ?? const BeautyEquipment(),
        androidEquipment: androidEquipment ?? const AndroidEquipment(),
        skillInfo: skillInfo ?? const SkillInfo(),
        linkSkill: linkSkill ?? const LinkSkill(),
        vMatrixInfo: vMatrixInfo ?? const VMatrixInfo(),
        hexaMatrixInfo: hexaMatrixInfo ?? const HexaMatrixInfo(),
        hexaMatrixStat: hexaMatrixStat ?? const HexaMatrixStat(),
        studioTopRecordInfo: studioTopRecordInfo ?? const StudioTopRecordInfo(),
        isLoading: isLoading,
      ));
    }
  }
}

