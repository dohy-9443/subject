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

  Future<void> getAbility(GetHomeEvent<Ability> event, Emitter<HomeState> emit) async {
    await fetchData<Ability>(
      cacheKey: 'getAbility',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getAbilityUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('Ability data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) {
        if (state is HomeSuccess) {
          emit((state as HomeSuccess).copyWith(ability: data));
        } else {
          emit(HomeState.success(
            ability: data,
            propensity: (state is HomeSuccess) ? (state as HomeSuccess).propensity : const Propensity(),
            popularity: (state is HomeSuccess) ? (state as HomeSuccess).popularity : const Popularity(),
            itemEquipment: (state is HomeSuccess) ? (state as HomeSuccess).itemEquipment : const ItemEquipment(),
            cashItemEquipment: (state is HomeSuccess) ? (state as HomeSuccess).cashItemEquipment : const CashItemEquipment(),
            setEffect: (state is HomeSuccess) ? (state as HomeSuccess).setEffect : const SetEffect(),
            symbolEquipment: (state is HomeSuccess) ? (state as HomeSuccess).symbolEquipment : const SymbolEquipment(),
            stat: (state is HomeSuccess) ? (state as HomeSuccess).stat : const Stat(),
            hyperStat: (state is HomeSuccess) ? (state as HomeSuccess).hyperStat : const HyperStat(),
            petEquipment: (state is HomeSuccess) ? (state as HomeSuccess).petEquipment : const PetEquipment(),
            beautyEquipment: (state is HomeSuccess) ? (state as HomeSuccess).beautyEquipment : const BeautyEquipment(),
            androidEquipment: (state is HomeSuccess) ? (state as HomeSuccess).androidEquipment : const AndroidEquipment(),
            skillInfo: (state is HomeSuccess) ? (state as HomeSuccess).skillInfo : const SkillInfo(),
            linkSkill: (state is HomeSuccess) ? (state as HomeSuccess).linkSkill : const LinkSkill(),
            vMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).vMatrixInfo : const VMatrixInfo(),
            hexaMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixInfo : const HexaMatrixInfo(),
            hexaMatrixStat: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixStat : const HexaMatrixStat(),
            studioTopRecordInfo: (state is HomeSuccess) ? (state as HomeSuccess).studioTopRecordInfo : const StudioTopRecordInfo(),
          ));
        }
      },
    );
  }

  Future<void> getPropensity(GetHomeEvent<Propensity> event, Emitter<HomeState> emit) async {
    await fetchData<Propensity>(
      cacheKey: 'getPropensity',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getPropensityUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('Propensity data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) {
        if (state is HomeSuccess) {
          emit((state as HomeSuccess).copyWith(propensity: data));
        } else {
          emit(HomeState.success(
            ability: (state is HomeSuccess) ? (state as HomeSuccess).ability : const Ability(abilityPreset1: AbilityPreset(), abilityPreset2: AbilityPreset(), abilityPreset3: AbilityPreset()),
            propensity: data,
            popularity: (state is HomeSuccess) ? (state as HomeSuccess).popularity : const Popularity(),
            itemEquipment: (state is HomeSuccess) ? (state as HomeSuccess).itemEquipment : const ItemEquipment(),
            cashItemEquipment: (state is HomeSuccess) ? (state as HomeSuccess).cashItemEquipment : const CashItemEquipment(),
            setEffect: (state is HomeSuccess) ? (state as HomeSuccess).setEffect : const SetEffect(),
            symbolEquipment: (state is HomeSuccess) ? (state as HomeSuccess).symbolEquipment : const SymbolEquipment(),
            stat: (state is HomeSuccess) ? (state as HomeSuccess).stat : const Stat(),
            hyperStat: (state is HomeSuccess) ? (state as HomeSuccess).hyperStat : const HyperStat(),
            petEquipment: (state is HomeSuccess) ? (state as HomeSuccess).petEquipment : const PetEquipment(),
            beautyEquipment: (state is HomeSuccess) ? (state as HomeSuccess).beautyEquipment : const BeautyEquipment(),
            androidEquipment: (state is HomeSuccess) ? (state as HomeSuccess).androidEquipment : const AndroidEquipment(),
            skillInfo: (state is HomeSuccess) ? (state as HomeSuccess).skillInfo : const SkillInfo(),
            linkSkill: (state is HomeSuccess) ? (state as HomeSuccess).linkSkill : const LinkSkill(),
            vMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).vMatrixInfo : const VMatrixInfo(),
            hexaMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixInfo : const HexaMatrixInfo(),
            hexaMatrixStat: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixStat : const HexaMatrixStat(),
            studioTopRecordInfo: (state is HomeSuccess) ? (state as HomeSuccess).studioTopRecordInfo : const StudioTopRecordInfo(),
          ));
        }
      },
    );
  }

  Future<void> getPopularity(GetHomeEvent<Popularity> event, Emitter<HomeState> emit) async {
    await fetchData<Popularity>(
      cacheKey: 'getPopularity',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getPopularityUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('Popularity data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) {
        if (state is HomeSuccess) {
          emit((state as HomeSuccess).copyWith(popularity: data));
        } else {
          emit(HomeState.success(
            ability: (state is HomeSuccess) ? (state as HomeSuccess).ability : const Ability(abilityPreset1: AbilityPreset(), abilityPreset2: AbilityPreset(), abilityPreset3: AbilityPreset()),
            propensity: state is HomeSuccess ? (state as HomeSuccess).propensity : const Propensity(),
            popularity: data,
            itemEquipment: (state is HomeSuccess) ? (state as HomeSuccess).itemEquipment : const ItemEquipment(),
            cashItemEquipment: (state is HomeSuccess) ? (state as HomeSuccess).cashItemEquipment : const CashItemEquipment(),
            setEffect: (state is HomeSuccess) ? (state as HomeSuccess).setEffect : const SetEffect(),
            symbolEquipment: (state is HomeSuccess) ? (state as HomeSuccess).symbolEquipment : const SymbolEquipment(),
            stat: (state is HomeSuccess) ? (state as HomeSuccess).stat : const Stat(),
            hyperStat: (state is HomeSuccess) ? (state as HomeSuccess).hyperStat : const HyperStat(),
            petEquipment: (state is HomeSuccess) ? (state as HomeSuccess).petEquipment : const PetEquipment(),
            beautyEquipment: (state is HomeSuccess) ? (state as HomeSuccess).beautyEquipment : const BeautyEquipment(),
            androidEquipment: (state is HomeSuccess) ? (state as HomeSuccess).androidEquipment : const AndroidEquipment(),
            skillInfo: (state is HomeSuccess) ? (state as HomeSuccess).skillInfo : const SkillInfo(),
            linkSkill: (state is HomeSuccess) ? (state as HomeSuccess).linkSkill : const LinkSkill(),
            vMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).vMatrixInfo : const VMatrixInfo(),
            hexaMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixInfo : const HexaMatrixInfo(),
            hexaMatrixStat: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixStat : const HexaMatrixStat(),
            studioTopRecordInfo: (state is HomeSuccess) ? (state as HomeSuccess).studioTopRecordInfo : const StudioTopRecordInfo(),
          ));
        }
      },
    );
  }

  Future<void> getItemEquipment(GetHomeEvent<ItemEquipment> event, Emitter<HomeState> emit) async {
    await fetchData<ItemEquipment>(
      cacheKey: 'getItemEquipment',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getItemEquipmentUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('ItemEquipment data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) {
        if (state is HomeSuccess) {
          emit((state as HomeSuccess).copyWith(itemEquipment: data));
        } else {
          emit(HomeState.success(
            ability: (state is HomeSuccess) ? (state as HomeSuccess).ability : const Ability(abilityPreset1: AbilityPreset(), abilityPreset2: AbilityPreset(), abilityPreset3: AbilityPreset()),
            propensity: state is HomeSuccess ? (state as HomeSuccess).propensity : const Propensity(),
            popularity: state is HomeSuccess ? (state as HomeSuccess).popularity : const Popularity(),
            itemEquipment: data,
            cashItemEquipment: (state is HomeSuccess) ? (state as HomeSuccess).cashItemEquipment : const CashItemEquipment(),
            setEffect: (state is HomeSuccess) ? (state as HomeSuccess).setEffect : const SetEffect(),
            symbolEquipment: (state is HomeSuccess) ? (state as HomeSuccess).symbolEquipment : const SymbolEquipment(),
            stat: (state is HomeSuccess) ? (state as HomeSuccess).stat : const Stat(),
            hyperStat: (state is HomeSuccess) ? (state as HomeSuccess).hyperStat : const HyperStat(),
            petEquipment: (state is HomeSuccess) ? (state as HomeSuccess).petEquipment : const PetEquipment(),
            beautyEquipment: (state is HomeSuccess) ? (state as HomeSuccess).beautyEquipment : const BeautyEquipment(),
            androidEquipment: (state is HomeSuccess) ? (state as HomeSuccess).androidEquipment : const AndroidEquipment(),
            skillInfo: (state is HomeSuccess) ? (state as HomeSuccess).skillInfo : const SkillInfo(),
            linkSkill: (state is HomeSuccess) ? (state as HomeSuccess).linkSkill : const LinkSkill(),
            vMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).vMatrixInfo : const VMatrixInfo(),
            hexaMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixInfo : const HexaMatrixInfo(),
            hexaMatrixStat: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixStat : const HexaMatrixStat(),
            studioTopRecordInfo: (state is HomeSuccess) ? (state as HomeSuccess).studioTopRecordInfo : const StudioTopRecordInfo(),
          ));
        }
      },
    );
  }

  Future<void> getCashItemEquipment(GetHomeEvent<CashItemEquipment> event, Emitter<HomeState> emit) async {
    await fetchData<CashItemEquipment>(
      cacheKey: 'getCashItemEquipment',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getCashItemEquipmentUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('CashItemEquipment data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) {
        if (state is HomeSuccess) {
          emit((state as HomeSuccess).copyWith(cashItemEquipment: data));
        } else {
          emit(HomeState.success(
            ability: (state is HomeSuccess) ? (state as HomeSuccess).ability : const Ability(abilityPreset1: AbilityPreset(), abilityPreset2: AbilityPreset(), abilityPreset3: AbilityPreset()),
            propensity: state is HomeSuccess ? (state as HomeSuccess).propensity : const Propensity(),
            popularity: state is HomeSuccess ? (state as HomeSuccess).popularity : const Popularity(),
            itemEquipment: state is HomeSuccess ? (state as HomeSuccess).itemEquipment : const ItemEquipment(),
            cashItemEquipment: data,
            setEffect: (state is HomeSuccess) ? (state as HomeSuccess).setEffect : const SetEffect(),
            symbolEquipment: (state is HomeSuccess) ? (state as HomeSuccess).symbolEquipment : const SymbolEquipment(),
            stat: (state is HomeSuccess) ? (state as HomeSuccess).stat : const Stat(),
            hyperStat: (state is HomeSuccess) ? (state as HomeSuccess).hyperStat : const HyperStat(),
            petEquipment: (state is HomeSuccess) ? (state as HomeSuccess).petEquipment : const PetEquipment(),
            beautyEquipment: (state is HomeSuccess) ? (state as HomeSuccess).beautyEquipment : const BeautyEquipment(),
            androidEquipment: (state is HomeSuccess) ? (state as HomeSuccess).androidEquipment : const AndroidEquipment(),
            skillInfo: (state is HomeSuccess) ? (state as HomeSuccess).skillInfo : const SkillInfo(),
            linkSkill: (state is HomeSuccess) ? (state as HomeSuccess).linkSkill : const LinkSkill(),
            vMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).vMatrixInfo : const VMatrixInfo(),
            hexaMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixInfo : const HexaMatrixInfo(),
            hexaMatrixStat: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixStat : const HexaMatrixStat(),
            studioTopRecordInfo: (state is HomeSuccess) ? (state as HomeSuccess).studioTopRecordInfo : const StudioTopRecordInfo(),
          ));
        }
      },
    );
  }

  Future<void> getSetEffect(GetHomeEvent<SetEffect> event, Emitter<HomeState> emit) async {
    await fetchData<SetEffect>(
      cacheKey: 'getSetEffect',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getSetEffectUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('SetEffect data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) {
        if (state is HomeSuccess) {
          emit((state as HomeSuccess).copyWith(setEffect: data));
        } else {
          emit(HomeState.success(
            ability: (state is HomeSuccess) ? (state as HomeSuccess).ability : const Ability(abilityPreset1: AbilityPreset(), abilityPreset2: AbilityPreset(), abilityPreset3: AbilityPreset()),
            propensity: state is HomeSuccess ? (state as HomeSuccess).propensity : const Propensity(),
            popularity: state is HomeSuccess ? (state as HomeSuccess).popularity : const Popularity(),
            itemEquipment: state is HomeSuccess ? (state as HomeSuccess).itemEquipment : const ItemEquipment(),
            cashItemEquipment: state is HomeSuccess ? (state as HomeSuccess).cashItemEquipment : const CashItemEquipment(),
            setEffect: data,
            symbolEquipment: (state is HomeSuccess) ? (state as HomeSuccess).symbolEquipment : const SymbolEquipment(),
            stat: (state is HomeSuccess) ? (state as HomeSuccess).stat : const Stat(),
            hyperStat: (state is HomeSuccess) ? (state as HomeSuccess).hyperStat : const HyperStat(),
            petEquipment: (state is HomeSuccess) ? (state as HomeSuccess).petEquipment : const PetEquipment(),
            beautyEquipment: (state is HomeSuccess) ? (state as HomeSuccess).beautyEquipment : const BeautyEquipment(),
            androidEquipment: (state is HomeSuccess) ? (state as HomeSuccess).androidEquipment : const AndroidEquipment(),
            skillInfo: (state is HomeSuccess) ? (state as HomeSuccess).skillInfo : const SkillInfo(),
            linkSkill: (state is HomeSuccess) ? (state as HomeSuccess).linkSkill : const LinkSkill(),
            vMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).vMatrixInfo : const VMatrixInfo(),
            hexaMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixInfo : const HexaMatrixInfo(),
            hexaMatrixStat: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixStat : const HexaMatrixStat(),
            studioTopRecordInfo: (state is HomeSuccess) ? (state as HomeSuccess).studioTopRecordInfo : const StudioTopRecordInfo(),
          ));
        }
      },
    );
  }

  Future<void> getSymbolEquipment(GetHomeEvent<SymbolEquipment> event, Emitter<HomeState> emit) async {
    await fetchData<SymbolEquipment>(
      cacheKey: 'getSymbolEquipment',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getSymbolEquipmentUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('SymbolEquipment data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) {
        if (state is HomeSuccess) {
          emit((state as HomeSuccess).copyWith(symbolEquipment: data));
        } else {
          emit(HomeState.success(
            ability: (state is HomeSuccess) ? (state as HomeSuccess).ability : const Ability(abilityPreset1: AbilityPreset(), abilityPreset2: AbilityPreset(), abilityPreset3: AbilityPreset()),
            propensity: state is HomeSuccess ? (state as HomeSuccess).propensity : const Propensity(),
            popularity: state is HomeSuccess ? (state as HomeSuccess).popularity : const Popularity(),
            itemEquipment: state is HomeSuccess ? (state as HomeSuccess).itemEquipment : const ItemEquipment(),
            cashItemEquipment: state is HomeSuccess ? (state as HomeSuccess).cashItemEquipment : const CashItemEquipment(),
            setEffect: (state is HomeSuccess) ? (state as HomeSuccess).setEffect : const SetEffect(),
            symbolEquipment: data,
            stat: (state is HomeSuccess) ? (state as HomeSuccess).stat : const Stat(),
            hyperStat: (state is HomeSuccess) ? (state as HomeSuccess).hyperStat : const HyperStat(),
            petEquipment: (state is HomeSuccess) ? (state as HomeSuccess).petEquipment : const PetEquipment(),
            beautyEquipment: (state is HomeSuccess) ? (state as HomeSuccess).beautyEquipment : const BeautyEquipment(),
            androidEquipment: (state is HomeSuccess) ? (state as HomeSuccess).androidEquipment : const AndroidEquipment(),
            skillInfo: (state is HomeSuccess) ? (state as HomeSuccess).skillInfo : const SkillInfo(),
            linkSkill: (state is HomeSuccess) ? (state as HomeSuccess).linkSkill : const LinkSkill(),
            vMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).vMatrixInfo : const VMatrixInfo(),
            hexaMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixInfo : const HexaMatrixInfo(),
            hexaMatrixStat: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixStat : const HexaMatrixStat(),
            studioTopRecordInfo: (state is HomeSuccess) ? (state as HomeSuccess).studioTopRecordInfo : const StudioTopRecordInfo(),
          ));
        }
      },
    );
  }

  Future<void> getStat(GetHomeEvent<Stat> event, Emitter<HomeState> emit) async {
    await fetchData<Stat>(
      cacheKey: 'getStat',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getStatUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('Stat data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) {
        if (state is HomeSuccess) {
          emit((state as HomeSuccess).copyWith(stat: data));
        } else {
          emit(HomeState.success(
            ability: (state is HomeSuccess) ? (state as HomeSuccess).ability : const Ability(abilityPreset1: AbilityPreset(), abilityPreset2: AbilityPreset(), abilityPreset3: AbilityPreset()),
            propensity: state is HomeSuccess ? (state as HomeSuccess).propensity : const Propensity(),
            popularity: state is HomeSuccess ? (state as HomeSuccess).popularity : const Popularity(),
            itemEquipment: state is HomeSuccess ? (state as HomeSuccess).itemEquipment : const ItemEquipment(),
            cashItemEquipment: state is HomeSuccess ? (state as HomeSuccess).cashItemEquipment : const CashItemEquipment(),
            setEffect: (state is HomeSuccess) ? (state as HomeSuccess).setEffect : const SetEffect(),
            symbolEquipment: (state is HomeSuccess) ? (state as HomeSuccess).symbolEquipment : const SymbolEquipment(),
            stat: data,
            hyperStat: (state is HomeSuccess) ? (state as HomeSuccess).hyperStat : const HyperStat(),
            petEquipment: (state is HomeSuccess) ? (state as HomeSuccess).petEquipment : const PetEquipment(),
            beautyEquipment: (state is HomeSuccess) ? (state as HomeSuccess).beautyEquipment : const BeautyEquipment(),
            androidEquipment: (state is HomeSuccess) ? (state as HomeSuccess).androidEquipment : const AndroidEquipment(),
            skillInfo: (state is HomeSuccess) ? (state as HomeSuccess).skillInfo : const SkillInfo(),
            linkSkill: (state is HomeSuccess) ? (state as HomeSuccess).linkSkill : const LinkSkill(),
            vMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).vMatrixInfo : const VMatrixInfo(),
            hexaMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixInfo : const HexaMatrixInfo(),
            hexaMatrixStat: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixStat : const HexaMatrixStat(),
            studioTopRecordInfo: (state is HomeSuccess) ? (state as HomeSuccess).studioTopRecordInfo : const StudioTopRecordInfo(),
          ));
        }
      },
    );
  }

  /// TODO : loading type 으로 변하면서 이슈발생 이전값을 유지하지못하고 초기화가됨

  Future<void> getHyperStat(GetHomeEvent<HyperStat> event, Emitter<HomeState> emit) async {
    await fetchData<HyperStat>(
      cacheKey: 'getHyperStat',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getHyperStatUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('HyperStat data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) {
        if (state is HomeSuccess) {

          emit((state as HomeSuccess).copyWith(hyperStat: data));
        } else {

          emit(HomeState.success(
            ability: (state is HomeSuccess) ? (state as HomeSuccess).ability : const Ability(abilityPreset1: AbilityPreset(), abilityPreset2: AbilityPreset(), abilityPreset3: AbilityPreset()),
            propensity: state is HomeSuccess ? (state as HomeSuccess).propensity : const Propensity(),
            popularity: state is HomeSuccess ? (state as HomeSuccess).popularity : const Popularity(),
            itemEquipment: state is HomeSuccess ? (state as HomeSuccess).itemEquipment : const ItemEquipment(),
            cashItemEquipment: state is HomeSuccess ? (state as HomeSuccess).cashItemEquipment : const CashItemEquipment(),
            setEffect: (state is HomeSuccess) ? (state as HomeSuccess).setEffect : const SetEffect(),
            symbolEquipment: (state is HomeSuccess) ? (state as HomeSuccess).symbolEquipment : const SymbolEquipment(),
            stat: (state is HomeSuccess) ? (state as HomeSuccess).stat : const Stat(),
            hyperStat: data,
            petEquipment: (state is HomeSuccess) ? (state as HomeSuccess).petEquipment : const PetEquipment(),
            beautyEquipment: (state is HomeSuccess) ? (state as HomeSuccess).beautyEquipment : const BeautyEquipment(),
            androidEquipment: (state is HomeSuccess) ? (state as HomeSuccess).androidEquipment : const AndroidEquipment(),
            skillInfo: (state is HomeSuccess) ? (state as HomeSuccess).skillInfo : const SkillInfo(),
            linkSkill: (state is HomeSuccess) ? (state as HomeSuccess).linkSkill : const LinkSkill(),
            vMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).vMatrixInfo : const VMatrixInfo(),
            hexaMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixInfo : const HexaMatrixInfo(),
            hexaMatrixStat: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixStat : const HexaMatrixStat(),
            studioTopRecordInfo: (state is HomeSuccess) ? (state as HomeSuccess).studioTopRecordInfo : const StudioTopRecordInfo(),
          ));
        }
      },
    );
  }

  Future<void> getPetEquipment(GetHomeEvent<PetEquipment> event, Emitter<HomeState> emit) async {
    await fetchData<PetEquipment>(
      cacheKey: 'getPetEquipment',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getPetEquipmentUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('PetEquipment data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) {
        if (state is HomeSuccess) {
          emit((state as HomeSuccess).copyWith(petEquipment: data));
        } else {
          emit(HomeState.success(
            ability: (state is HomeSuccess) ? (state as HomeSuccess).ability : const Ability(abilityPreset1: AbilityPreset(), abilityPreset2: AbilityPreset(), abilityPreset3: AbilityPreset()),
            propensity: state is HomeSuccess ? (state as HomeSuccess).propensity : const Propensity(),
            popularity: state is HomeSuccess ? (state as HomeSuccess).popularity : const Popularity(),
            itemEquipment: state is HomeSuccess ? (state as HomeSuccess).itemEquipment : const ItemEquipment(),
            cashItemEquipment: state is HomeSuccess ? (state as HomeSuccess).cashItemEquipment : const CashItemEquipment(),
            setEffect: (state is HomeSuccess) ? (state as HomeSuccess).setEffect : const SetEffect(),
            symbolEquipment: (state is HomeSuccess) ? (state as HomeSuccess).symbolEquipment : const SymbolEquipment(),
            stat: (state is HomeSuccess) ? (state as HomeSuccess).stat : const Stat(),
            hyperStat: (state is HomeSuccess) ? (state as HomeSuccess).hyperStat : const HyperStat(),
            petEquipment: data,
            beautyEquipment: state is HomeSuccess ? (state as HomeSuccess).beautyEquipment : const BeautyEquipment(),
            androidEquipment: (state is HomeSuccess) ? (state as HomeSuccess).androidEquipment : const AndroidEquipment(),
            skillInfo: (state is HomeSuccess) ? (state as HomeSuccess).skillInfo : const SkillInfo(),
            linkSkill: (state is HomeSuccess) ? (state as HomeSuccess).linkSkill : const LinkSkill(),
            vMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).vMatrixInfo : const VMatrixInfo(),
            hexaMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixInfo : const HexaMatrixInfo(),
            hexaMatrixStat: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixStat : const HexaMatrixStat(),
            studioTopRecordInfo: (state is HomeSuccess) ? (state as HomeSuccess).studioTopRecordInfo : const StudioTopRecordInfo(),
          ));
        }
      },
    );
  }

  Future<void> getBeautyEquipment(GetHomeEvent<BeautyEquipment> event, Emitter<HomeState> emit) async {
    await fetchData<BeautyEquipment>(
      cacheKey: 'getBeautyEquipment',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getBeautyEquipmentUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('BeautyEquipment data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) {
        if (state is HomeSuccess) {
          emit((state as HomeSuccess).copyWith(beautyEquipment: data));
        } else {
          emit(HomeState.success(beautyEquipment: data));
        }
      },
    );
  }

  Future<void> getAndroidEquipment(GetHomeEvent<AndroidEquipment> event, Emitter<HomeState> emit) async {
    await fetchData<AndroidEquipment>(
      cacheKey: 'getAndroidEquipment',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getAndroidEquipmentUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('AndroidEquipment data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) {
        if (state is HomeSuccess) {
          emit((state as HomeSuccess).copyWith(androidEquipment: data));
        } else {
          emit(HomeState.success(
            ability: (state is HomeSuccess) ? (state as HomeSuccess).ability : const Ability(abilityPreset1: AbilityPreset(), abilityPreset2: AbilityPreset(), abilityPreset3: AbilityPreset()),
            propensity: state is HomeSuccess ? (state as HomeSuccess).propensity : const Propensity(),
            popularity: state is HomeSuccess ? (state as HomeSuccess).popularity : const Popularity(),
            itemEquipment: state is HomeSuccess ? (state as HomeSuccess).itemEquipment : const ItemEquipment(),
            cashItemEquipment: state is HomeSuccess ? (state as HomeSuccess).cashItemEquipment : const CashItemEquipment(),
            setEffect: (state is HomeSuccess) ? (state as HomeSuccess).setEffect : const SetEffect(),
            symbolEquipment: (state is HomeSuccess) ? (state as HomeSuccess).symbolEquipment : const SymbolEquipment(),
            stat: (state is HomeSuccess) ? (state as HomeSuccess).stat : const Stat(),
            hyperStat: (state is HomeSuccess) ? (state as HomeSuccess).hyperStat : const HyperStat(),
            petEquipment: (state is HomeSuccess) ? (state as HomeSuccess).petEquipment : const PetEquipment(),
            beautyEquipment: (state is HomeSuccess) ? (state as HomeSuccess).beautyEquipment : const BeautyEquipment(),
            androidEquipment: data,
            skillInfo: (state is HomeSuccess) ? (state as HomeSuccess).skillInfo : const SkillInfo(),
            linkSkill: (state is HomeSuccess) ? (state as HomeSuccess).linkSkill : const LinkSkill(),
            vMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).vMatrixInfo : const VMatrixInfo(),
            hexaMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixInfo : const HexaMatrixInfo(),
            hexaMatrixStat: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixStat : const HexaMatrixStat(),
            studioTopRecordInfo: (state is HomeSuccess) ? (state as HomeSuccess).studioTopRecordInfo : const StudioTopRecordInfo(),
          ));
        }
      },
    );
  }

  Future<void> getSkillInfo(GetSkillEvent<SkillInfo> event, Emitter<HomeState> emit) async {
    await fetchData<SkillInfo>(
      cacheKey: 'getSkillInfo',
      fetchFunction: () async {
        final params = SkillInfoParams(ocid: event.ocid, date: event.date, characterSkillGrade: event.characterSkillGrade);
        final res = await _getSkillInfoUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('SkillInfo data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) {
        if (state is HomeSuccess) {
          emit((state as HomeSuccess).copyWith(skillInfo: data));
        } else {
          emit(HomeState.success(
            ability: (state is HomeSuccess) ? (state as HomeSuccess).ability : const Ability(abilityPreset1: AbilityPreset(), abilityPreset2: AbilityPreset(), abilityPreset3: AbilityPreset()),
            propensity: state is HomeSuccess ? (state as HomeSuccess).propensity : const Propensity(),
            popularity: state is HomeSuccess ? (state as HomeSuccess).popularity : const Popularity(),
            itemEquipment: state is HomeSuccess ? (state as HomeSuccess).itemEquipment : const ItemEquipment(),
            cashItemEquipment: state is HomeSuccess ? (state as HomeSuccess).cashItemEquipment : const CashItemEquipment(),
            setEffect: (state is HomeSuccess) ? (state as HomeSuccess).setEffect : const SetEffect(),
            symbolEquipment: (state is HomeSuccess) ? (state as HomeSuccess).symbolEquipment : const SymbolEquipment(),
            stat: (state is HomeSuccess) ? (state as HomeSuccess).stat : const Stat(),
            hyperStat: (state is HomeSuccess) ? (state as HomeSuccess).hyperStat : const HyperStat(),
            petEquipment: (state is HomeSuccess) ? (state as HomeSuccess).petEquipment : const PetEquipment(),
            beautyEquipment: (state is HomeSuccess) ? (state as HomeSuccess).beautyEquipment : const BeautyEquipment(),
            androidEquipment: (state is HomeSuccess) ? (state as HomeSuccess).androidEquipment : const AndroidEquipment(),
            skillInfo: data,
            linkSkill: (state is HomeSuccess) ? (state as HomeSuccess).linkSkill : const LinkSkill(),
            vMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).vMatrixInfo : const VMatrixInfo(),
            hexaMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixInfo : const HexaMatrixInfo(),
            hexaMatrixStat: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixStat : const HexaMatrixStat(),
            studioTopRecordInfo: (state is HomeSuccess) ? (state as HomeSuccess).studioTopRecordInfo : const StudioTopRecordInfo(),
          ));
        }
      },
    );
  }

  Future<void> getLinkSkill(GetHomeEvent<LinkSkill> event, Emitter<HomeState> emit) async {
    await fetchData<LinkSkill>(
      cacheKey: 'getLinkSkill',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getLinkSkillUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('LinkSkill data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) {
        if (state is HomeSuccess) {
          emit((state as HomeSuccess).copyWith(linkSkill: data));
        } else {
          emit(HomeState.success(
            ability: (state is HomeSuccess) ? (state as HomeSuccess).ability : const Ability(abilityPreset1: AbilityPreset(), abilityPreset2: AbilityPreset(), abilityPreset3: AbilityPreset()),
            propensity: state is HomeSuccess ? (state as HomeSuccess).propensity : const Propensity(),
            popularity: state is HomeSuccess ? (state as HomeSuccess).popularity : const Popularity(),
            itemEquipment: state is HomeSuccess ? (state as HomeSuccess).itemEquipment : const ItemEquipment(),
            cashItemEquipment: state is HomeSuccess ? (state as HomeSuccess).cashItemEquipment : const CashItemEquipment(),
            setEffect: (state is HomeSuccess) ? (state as HomeSuccess).setEffect : const SetEffect(),
            symbolEquipment: (state is HomeSuccess) ? (state as HomeSuccess).symbolEquipment : const SymbolEquipment(),
            stat: (state is HomeSuccess) ? (state as HomeSuccess).stat : const Stat(),
            hyperStat: (state is HomeSuccess) ? (state as HomeSuccess).hyperStat : const HyperStat(),
            petEquipment: (state is HomeSuccess) ? (state as HomeSuccess).petEquipment : const PetEquipment(),
            beautyEquipment: (state is HomeSuccess) ? (state as HomeSuccess).beautyEquipment : const BeautyEquipment(),
            androidEquipment: (state is HomeSuccess) ? (state as HomeSuccess).androidEquipment : const AndroidEquipment(),
            skillInfo: (state is HomeSuccess) ? (state as HomeSuccess).skillInfo : const SkillInfo(),
            linkSkill: data,
            vMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).vMatrixInfo : const VMatrixInfo(),
            hexaMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixInfo : const HexaMatrixInfo(),
            hexaMatrixStat: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixStat : const HexaMatrixStat(),
            studioTopRecordInfo: (state is HomeSuccess) ? (state as HomeSuccess).studioTopRecordInfo : const StudioTopRecordInfo(),
          ));
        }
      },
    );
  }

  Future<void> getVMatrixInfo(GetHomeEvent<VMatrixInfo> event, Emitter<HomeState> emit) async {
    await fetchData<VMatrixInfo>(
      cacheKey: 'getVMatrixInfo',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getVMatrixUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('VMatrixInfo data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) {
        if (state is HomeSuccess) {
          emit((state as HomeSuccess).copyWith(vMatrixInfo: data));
        } else {
          emit(HomeState.success(
            ability: (state is HomeSuccess) ? (state as HomeSuccess).ability : const Ability(abilityPreset1: AbilityPreset(), abilityPreset2: AbilityPreset(), abilityPreset3: AbilityPreset()),
            propensity: state is HomeSuccess ? (state as HomeSuccess).propensity : const Propensity(),
            popularity: state is HomeSuccess ? (state as HomeSuccess).popularity : const Popularity(),
            itemEquipment: state is HomeSuccess ? (state as HomeSuccess).itemEquipment : const ItemEquipment(),
            cashItemEquipment: state is HomeSuccess ? (state as HomeSuccess).cashItemEquipment : const CashItemEquipment(),
            setEffect: (state is HomeSuccess) ? (state as HomeSuccess).setEffect : const SetEffect(),
            symbolEquipment: (state is HomeSuccess) ? (state as HomeSuccess).symbolEquipment : const SymbolEquipment(),
            stat: (state is HomeSuccess) ? (state as HomeSuccess).stat : const Stat(),
            hyperStat: (state is HomeSuccess) ? (state as HomeSuccess).hyperStat : const HyperStat(),
            petEquipment: (state is HomeSuccess) ? (state as HomeSuccess).petEquipment : const PetEquipment(),
            beautyEquipment: (state is HomeSuccess) ? (state as HomeSuccess).beautyEquipment : const BeautyEquipment(),
            androidEquipment: (state is HomeSuccess) ? (state as HomeSuccess).androidEquipment : const AndroidEquipment(),
            skillInfo: (state is HomeSuccess) ? (state as HomeSuccess).skillInfo : const SkillInfo(),
            linkSkill: (state is HomeSuccess) ? (state as HomeSuccess).linkSkill : const LinkSkill(),
            vMatrixInfo: data,
            hexaMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixInfo : const HexaMatrixInfo(),
            hexaMatrixStat: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixStat : const HexaMatrixStat(),
            studioTopRecordInfo: (state is HomeSuccess) ? (state as HomeSuccess).studioTopRecordInfo : const StudioTopRecordInfo(),
          ));
        }
      },
    );
  }

  Future<void> getHexaMatrixInfo(GetHomeEvent<HexaMatrixInfo> event, Emitter<HomeState> emit) async {
    await fetchData<HexaMatrixInfo>(
      cacheKey: 'getHexaMatrixInfo',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getHexaMatrixInfoUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('HexaMatrixInfo data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) {
        if (state is HomeSuccess) {
          emit((state as HomeSuccess).copyWith(hexaMatrixInfo: data));
        } else {
          emit(HomeState.success(
            ability: (state is HomeSuccess) ? (state as HomeSuccess).ability : const Ability(abilityPreset1: AbilityPreset(), abilityPreset2: AbilityPreset(), abilityPreset3: AbilityPreset()),
            propensity: state is HomeSuccess ? (state as HomeSuccess).propensity : const Propensity(),
            popularity: state is HomeSuccess ? (state as HomeSuccess).popularity : const Popularity(),
            itemEquipment: state is HomeSuccess ? (state as HomeSuccess).itemEquipment : const ItemEquipment(),
            cashItemEquipment: state is HomeSuccess ? (state as HomeSuccess).cashItemEquipment : const CashItemEquipment(),
            setEffect: (state is HomeSuccess) ? (state as HomeSuccess).setEffect : const SetEffect(),
            symbolEquipment: (state is HomeSuccess) ? (state as HomeSuccess).symbolEquipment : const SymbolEquipment(),
            stat: (state is HomeSuccess) ? (state as HomeSuccess).stat : const Stat(),
            hyperStat: (state is HomeSuccess) ? (state as HomeSuccess).hyperStat : const HyperStat(),
            petEquipment: (state is HomeSuccess) ? (state as HomeSuccess).petEquipment : const PetEquipment(),
            beautyEquipment: (state is HomeSuccess) ? (state as HomeSuccess).beautyEquipment : const BeautyEquipment(),
            androidEquipment: (state is HomeSuccess) ? (state as HomeSuccess).androidEquipment : const AndroidEquipment(),
            skillInfo: (state is HomeSuccess) ? (state as HomeSuccess).skillInfo : const SkillInfo(),
            linkSkill: (state is HomeSuccess) ? (state as HomeSuccess).linkSkill : const LinkSkill(),
            vMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).vMatrixInfo : const VMatrixInfo(),
            hexaMatrixInfo: data,
            hexaMatrixStat: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixStat : const HexaMatrixStat(),
            studioTopRecordInfo: (state is HomeSuccess) ? (state as HomeSuccess).studioTopRecordInfo : const StudioTopRecordInfo(),
          ));
        }
      },
    );
  }

  Future<void> getHexaMatrixStat(GetHomeEvent<HexaMatrixStat> event, Emitter<HomeState> emit) async {
    await fetchData<HexaMatrixStat>(
      cacheKey: 'getHexaMatrixStat',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getHexaMatrixStatUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('HexaMatrixStat data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) {
        if (state is HomeSuccess) {
          emit((state as HomeSuccess).copyWith(hexaMatrixStat: data));
        } else {
          emit(HomeState.success(
            ability: (state is HomeSuccess) ? (state as HomeSuccess).ability : const Ability(abilityPreset1: AbilityPreset(), abilityPreset2: AbilityPreset(), abilityPreset3: AbilityPreset()),
            propensity: state is HomeSuccess ? (state as HomeSuccess).propensity : const Propensity(),
            popularity: state is HomeSuccess ? (state as HomeSuccess).popularity : const Popularity(),
            itemEquipment: state is HomeSuccess ? (state as HomeSuccess).itemEquipment : const ItemEquipment(),
            cashItemEquipment: state is HomeSuccess ? (state as HomeSuccess).cashItemEquipment : const CashItemEquipment(),
            setEffect: (state is HomeSuccess) ? (state as HomeSuccess).setEffect : const SetEffect(),
            symbolEquipment: (state is HomeSuccess) ? (state as HomeSuccess).symbolEquipment : const SymbolEquipment(),
            stat: (state is HomeSuccess) ? (state as HomeSuccess).stat : const Stat(),
            hyperStat: (state is HomeSuccess) ? (state as HomeSuccess).hyperStat : const HyperStat(),
            petEquipment: (state is HomeSuccess) ? (state as HomeSuccess).petEquipment : const PetEquipment(),
            beautyEquipment: (state is HomeSuccess) ? (state as HomeSuccess).beautyEquipment : const BeautyEquipment(),
            androidEquipment: (state is HomeSuccess) ? (state as HomeSuccess).androidEquipment : const AndroidEquipment(),
            skillInfo: (state is HomeSuccess) ? (state as HomeSuccess).skillInfo : const SkillInfo(),
            linkSkill: (state is HomeSuccess) ? (state as HomeSuccess).linkSkill : const LinkSkill(),
            vMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).vMatrixInfo : const VMatrixInfo(),
            hexaMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixInfo : const HexaMatrixInfo(),
            hexaMatrixStat: data,
            studioTopRecordInfo: (state is HomeSuccess) ? (state as HomeSuccess).studioTopRecordInfo : const StudioTopRecordInfo(),
          ));
        }
      },
    );
  }

  Future<void> getStudioTopRecordInfo(GetHomeEvent<StudioTopRecordInfo> event, Emitter<HomeState> emit) async {
    await fetchData<StudioTopRecordInfo>(
      cacheKey: 'getStudioTopRecordInfo',
      fetchFunction: () async {
        final params = BaseParams(ocid: event.ocid, date: event.date);
        final res = await _getStudioUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        if (res.data == null) throw Exception('StudioTopRecordInfo data is null');
        return res.data!;
      },
      emit: emit,
      onSuccess: (data) {
        if (state is HomeSuccess) {
          emit((state as HomeSuccess).copyWith(studioTopRecordInfo: data));
        } else {
          emit(HomeState.success(
            ability: (state is HomeSuccess) ? (state as HomeSuccess).ability : const Ability(abilityPreset1: AbilityPreset(), abilityPreset2: AbilityPreset(), abilityPreset3: AbilityPreset()),
            propensity: state is HomeSuccess ? (state as HomeSuccess).propensity : const Propensity(),
            popularity: state is HomeSuccess ? (state as HomeSuccess).popularity : const Popularity(),
            itemEquipment: state is HomeSuccess ? (state as HomeSuccess).itemEquipment : const ItemEquipment(),
            cashItemEquipment: state is HomeSuccess ? (state as HomeSuccess).cashItemEquipment : const CashItemEquipment(),
            setEffect: (state is HomeSuccess) ? (state as HomeSuccess).setEffect : const SetEffect(),
            symbolEquipment: (state is HomeSuccess) ? (state as HomeSuccess).symbolEquipment : const SymbolEquipment(),
            stat: (state is HomeSuccess) ? (state as HomeSuccess).stat : const Stat(),
            hyperStat: (state is HomeSuccess) ? (state as HomeSuccess).hyperStat : const HyperStat(),
            petEquipment: (state is HomeSuccess) ? (state as HomeSuccess).petEquipment : const PetEquipment(),
            beautyEquipment: (state is HomeSuccess) ? (state as HomeSuccess).beautyEquipment : const BeautyEquipment(),
            androidEquipment: (state is HomeSuccess) ? (state as HomeSuccess).androidEquipment : const AndroidEquipment(),
            skillInfo: (state is HomeSuccess) ? (state as HomeSuccess).skillInfo : const SkillInfo(),
            linkSkill: (state is HomeSuccess) ? (state as HomeSuccess).linkSkill : const LinkSkill(),
            vMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).vMatrixInfo : const VMatrixInfo(),
            hexaMatrixInfo: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixInfo : const HexaMatrixInfo(),
            hexaMatrixStat: (state is HomeSuccess) ? (state as HomeSuccess).hexaMatrixStat : const HexaMatrixStat(),
            studioTopRecordInfo: data,
          ));
        }
      },
    );
  }
}
