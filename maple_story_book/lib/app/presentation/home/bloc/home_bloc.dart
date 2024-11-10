import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/use_case/use_case.dart';
import 'package:maple_story_book/app/presentation/home/bloc/extension/home_extension.dart';
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
class HomeBloc extends Bloc<HomeEvent, HomeState> with HomeBlocMixin {
  final GetAbilityUseCase _getAbilityUseCase;
  final GetPropensityUseCase _getPropensityUseCase;
  final GetPopularityUseCase _getPopularityUseCase;
  final GetItemEquipmentUseCase _getItemEquipmentUseCase;
  final GetCashItemEquipmentUseCase _getCashItemEquipmentUseCase;
  final GetSetEffectUseCase _getSetEffectUseCase;
  final GetSymbolEquipmentUseCase _getSymbolEquipmentUseCase;
  final GetStatUseCase _getStatUseCase;
  final GetHyperStatUseCase _getHyperStatUseCase;
  final GetPetEquipmentUseCase _getPetEquipmentUseCase;
  final GetBeautyEquipmentUseCase _getBeautyEquipmentUseCase;
  final GetAndroidEquipmentUseCase _getAndroidEquipmentUseCase;
  final GetSkillInfoUseCase _getSkillInfoUseCase;
  final GetLinkSkillUseCase _getLinkSkillUseCase;
  final GetVMatrixUseCase _getVMatrixUseCase;
  final GetHexaMatrixInfoUseCase _getHexaMatrixInfoUseCase;
  final GetHexaMatrixStatUseCase _getHexaMatrixStatUseCase;
  final GetStudioUseCase _getStudioUseCase;

  HomeBloc(
      this._getAbilityUseCase,
      this._getPropensityUseCase,
      this._getPopularityUseCase,
      this._getItemEquipmentUseCase,
      this._getCashItemEquipmentUseCase,
      this._getSetEffectUseCase,
      this._getSymbolEquipmentUseCase,
      this._getStatUseCase,
      this._getHyperStatUseCase,
      this._getPetEquipmentUseCase,
      this._getBeautyEquipmentUseCase,
      this._getAndroidEquipmentUseCase,
      this._getSkillInfoUseCase,
      this._getLinkSkillUseCase,
      this._getVMatrixUseCase,
      this._getHexaMatrixInfoUseCase,
      this._getHexaMatrixStatUseCase,
      this._getStudioUseCase,
      ) : super(const HomeState.initial()) {
    on<GetHomeEvent<Ability>>(getAbility);
    on<GetHomeEvent<Propensity>>(getPropensity);
    on<GetHomeEvent<Popularity>>(getPopularity);
    on<GetHomeEvent<ItemEquipment>>(getItemEquipment);
    on<GetHomeEvent<CashItemEquipment>>(getCashItemEquipment);
    on<GetHomeEvent<SetEffect>>(getSetEffect);
    on<GetHomeEvent<SymbolEquipment>>(getSymbolEquipment);
    on<GetHomeEvent<Stat>>(getStat);
    on<GetHomeEvent<HyperStat>>(getHyperStat);
    on<GetHomeEvent<PetEquipment>>(getPetEquipment);
    on<GetHomeEvent<BeautyEquipment>>(getBeautyEquipment);
    on<GetHomeEvent<AndroidEquipment>>(getAndroidEquipment);
    on<GetSkillEvent<SkillInfo>>(getSkillInfo);
    on<GetHomeEvent<LinkSkill>>(getLinkSkill);
    on<GetHomeEvent<VMatrixInfo>>(getVMatrixInfo);
    on<GetHomeEvent<HexaMatrixInfo>>(getHexaMatrixInfo);
    on<GetHomeEvent<HexaMatrixStat>>(getHexaMatrixStat);
    on<GetHomeEvent<StudioTopRecordInfo>>(getStudioTopRecordInfo);
  }

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

  Future<void> _fetchData<T>({
    required String cacheKey,
    required Future<T> Function() fetchFunction,
    required Emitter<HomeState> emit,
    required void Function(T) onSuccess,
  }) async {
    if (_cache.containsKey(cacheKey) && !_isCacheExpired(_cache[cacheKey]!)) {
      final cachedData = _cache[cacheKey]!.data as T;
      onSuccess(cachedData);
    } else {
      emit(const HomeState.loading());
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

  Future<void> getAbility(GetHomeEvent<Ability> event, Emitter<HomeState> emit) async {
    await _fetchData<Ability>(
      cacheKey: 'getAbility',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getAbilityUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('Ability data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) => emit(HomeState.success(ability: data)),
    );
  }

  Future<void> getPropensity(GetHomeEvent<Propensity> event, Emitter<HomeState> emit) async {
    await _fetchData<Propensity>(
      cacheKey: 'getPropensity',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getPropensityUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('Propensity data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) => emit(HomeState.success(propensity: data)),
    );
  }

  Future<void> getPopularity(GetHomeEvent<Popularity> event, Emitter<HomeState> emit) async {
    await _fetchData<Popularity>(
      cacheKey: 'getPopularity',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getPopularityUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('Popularity data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) => emit(HomeState.success(popularity: data)),
    );
  }

  Future<void> getItemEquipment(GetHomeEvent<ItemEquipment> event, Emitter<HomeState> emit) async {
    await _fetchData<ItemEquipment>(
      cacheKey: 'getItemEquipment',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getItemEquipmentUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('ItemEquipment data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) => emit(HomeState.success(itemEquipment: data)),
    );
  }

  Future<void> getCashItemEquipment(GetHomeEvent<CashItemEquipment> event, Emitter<HomeState> emit) async {
    await _fetchData<CashItemEquipment>(
      cacheKey: 'getCashItemEquipment',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getCashItemEquipmentUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('CashItemEquipment data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) => emit(HomeState.success(cashItemEquipment: data)),
    );
  }

  Future<void> getSetEffect(GetHomeEvent<SetEffect> event, Emitter<HomeState> emit) async {
    await _fetchData<SetEffect>(
      cacheKey: 'getSetEffect',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getSetEffectUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('SetEffect data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) => emit(HomeState.success(setEffect: data)),
    );
  }

  Future<void> getSymbolEquipment(GetHomeEvent<SymbolEquipment> event, Emitter<HomeState> emit) async {
    await _fetchData<SymbolEquipment>(
      cacheKey: 'getSymbolEquipment',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getSymbolEquipmentUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('SymbolEquipment data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) => emit(HomeState.success(symbolEquipment: data)),
    );
  }

  Future<void> getStat(GetHomeEvent<Stat> event, Emitter<HomeState> emit) async {
    await _fetchData<Stat>(
      cacheKey: 'getStat',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getStatUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('Stat data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) => emit(HomeState.success(stat: data)),
    );
  }

  Future<void> getHyperStat(GetHomeEvent<HyperStat> event, Emitter<HomeState> emit) async {
    await _fetchData<HyperStat>(
      cacheKey: 'getHyperStat',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getHyperStatUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('HyperStat data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) => emit(HomeState.success(hyperStat: data)),
    );
  }

  Future<void> getPetEquipment(GetHomeEvent<PetEquipment> event, Emitter<HomeState> emit) async {
    await _fetchData<PetEquipment>(
      cacheKey: 'getPetEquipment',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getPetEquipmentUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('PetEquipment data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) => emit(HomeState.success(petEquipment: data)),
    );
  }

  Future<void> getBeautyEquipment(GetHomeEvent<BeautyEquipment> event, Emitter<HomeState> emit) async {
    await _fetchData<BeautyEquipment>(
      cacheKey: 'getBeautyEquipment',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getBeautyEquipmentUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('BeautyEquipment data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) => emit(HomeState.success(beautyEquipment: data)),
    );
  }

  Future<void> getAndroidEquipment(GetHomeEvent<AndroidEquipment> event, Emitter<HomeState> emit) async {
    await _fetchData<AndroidEquipment>(
      cacheKey: 'getAndroidEquipment',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getAndroidEquipmentUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('AndroidEquipment data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) => emit(HomeState.success(androidEquipment: data)),
    );
  }

  Future<void> getSkillInfo(GetSkillEvent<SkillInfo> event, Emitter<HomeState> emit) async {
    await _fetchData<SkillInfo>(
      cacheKey: 'getSkillInfo',
      fetchFunction: () async {
        final params = SkillInfoParams(ocid: event.ocid, date: event.date, characterSkillGrade: event.characterSkillGrade);
        final res = await _getSkillInfoUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('SkillInfo data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) => emit(HomeState.success(skillInfo: data)),
    );
  }

  Future<void> getLinkSkill(GetHomeEvent<LinkSkill> event, Emitter<HomeState> emit) async {
    await _fetchData<LinkSkill>(
      cacheKey: 'getLinkSkill',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getLinkSkillUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('LinkSkill data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) => emit(HomeState.success(linkSkill: data)),
    );
  }

  Future<void> getVMatrixInfo(GetHomeEvent<VMatrixInfo> event, Emitter<HomeState> emit) async {
    await _fetchData<VMatrixInfo>(
      cacheKey: 'getVMatrixInfo',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getVMatrixUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('VMatrixInfo data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) => emit(HomeState.success(vMatrixInfo: data)),
    );
  }

  Future<void> getHexaMatrixInfo(GetHomeEvent<HexaMatrixInfo> event, Emitter<HomeState> emit) async {
    await _fetchData<HexaMatrixInfo>(
      cacheKey: 'getHexaMatrixInfo',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getHexaMatrixInfoUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('HexaMatrixInfo data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) => emit(HomeState.success(hexaMatrixInfo: data)),
    );
  }

  Future<void> getHexaMatrixStat(GetHomeEvent<HexaMatrixStat> event, Emitter<HomeState> emit) async {
    await _fetchData<HexaMatrixStat>(
      cacheKey: 'getHexaMatrixStat',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getHexaMatrixStatUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('HexaMatrixStat data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) => emit(HomeState.success(hexaMatrixStat: data)),
    );
  }

  Future<void> getStudioTopRecordInfo(GetHomeEvent<StudioTopRecordInfo> event, Emitter<HomeState> emit) async {
    await _fetchData<StudioTopRecordInfo>(
      cacheKey: 'getStudioTopRecordInfo',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getStudioUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('StudioTopRecordInfo data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) => emit(HomeState.success(studioTopRecordInfo: data)),
    );
  }
}
