import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/use_case/use_case.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_event.dart';
import 'package:maple_story_book/app/presentation/home/bloc/home_state.dart';
import 'package:maple_story_book/app/presentation/home/extension/home_extension.dart';

///
/// @Project name    : maple_story_book
/// @Class           : home_bloc.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 26..
/// Description      :
///

@singleton
class HomeBloc extends Bloc<IHomeEvent, IHomeState> with HomeBlocMixin {
  final GetAbilityUseCase _getAbilityUseCase;
  final GetCharacterBasicUseCase _getCharacterBasicUseCase;
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
    this._getCharacterBasicUseCase,
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
  ) : super(HomeInitial()) {
    on<GetHomeEvent<Ability>>(getAbility);
    on<GetHomeEvent<BasicInfo>>(getCharacterBasic);
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
    on<GetSkillEvent>(getSkillInfo);
    on<GetHomeEvent<LinkSkill>>(getLinkSkill);
    on<GetHomeEvent<VMatrixInfo>>(getVMatrixInfo);
    on<GetHomeEvent<HexaMatrixInfo>>(getHexaMatrixInfo);
    on<GetHomeEvent<HexaMatrixStat>>(getHexaMatrixStat);
    on<GetHomeEvent<StudioTopRecordInfo>>(getStudioTopRecordInfo);

    // add(GetHomeEvent<Ability>('bc9ba6b1f13451d74458a513aad3b494'));
    // add(GetHomeEvent<BasicInfo>('bc9ba6b1f13451d74458a513aad3b494'));
    // add(GetHomeEvent<Propensity>('bc9ba6b1f13451d74458a513aad3b494'));
    // add(GetHomeEvent<ItemEquipment>('bc9ba6b1f13451d74458a513aad3b494')); // 이거 에러남
    // add(GetHomeEvent<CashItemEquipment>('bc9ba6b1f13451d74458a513aad3b494'));
    // add(GetHomeEvent<SetEffect>('bc9ba6b1f13451d74458a513aad3b494'));
    // add(GetHomeEvent<SymbolEquipment>('bc9ba6b1f13451d74458a513aad3b494'));
    // add(GetHomeEvent<Stat>('bc9ba6b1f13451d74458a513aad3b494'));
    // add(GetHomeEvent<HyperStat>('bc9ba6b1f13451d74458a513aad3b494'));
    // add(GetHomeEvent<PetEquipment>('bc9ba6b1f13451d74458a513aad3b494'));
  }

  Future<void> getAbility(GetHomeEvent<Ability> event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getAbilityUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(data: HomeData().copyWith(ability: res.data, isLoading: false)));
      },
      emit: emit,
    );
  }

  Future<void> getCharacterBasic(GetHomeEvent<BasicInfo> event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getCharacterBasicUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(data: HomeData().copyWith(basicInfo: res.data, isLoading: false)));
      },
      emit: emit,
    );
  }

  Future<void> getPropensity(GetHomeEvent<Propensity> event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getPropensityUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(data: HomeData().copyWith(propensity: res.data, isLoading: false)));
      },
      emit: emit,
    );
  }

  Future<void> getPopularity(GetHomeEvent<Popularity> event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getPopularityUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(data: HomeData().copyWith(popularity: res.data, isLoading: false)));
      },
      emit: emit,
    );
  }

  Future<void> getItemEquipment(GetHomeEvent<ItemEquipment> event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getItemEquipmentUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(data: HomeData().copyWith(itemEquipment: res.data, isLoading: false)));
      },
      emit: emit,
    );
  }

  Future<void> getCashItemEquipment(GetHomeEvent<CashItemEquipment> event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getCashItemEquipmentUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(data: HomeData().copyWith(cashItemEquipment: res.data, isLoading: false)));
      },
      emit: emit,
    );
  }

  Future<void> getSetEffect(GetHomeEvent<SetEffect> event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getSetEffectUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(data: HomeData().copyWith(setEffect: res.data, isLoading: false)));
      },
      emit: emit,
    );
  }

  Future<void> getSymbolEquipment(GetHomeEvent<SymbolEquipment> event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getSymbolEquipmentUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(data: HomeData().copyWith(symbolEquipment: res.data, isLoading: false)));
      },
      emit: emit,
    );
  }

  Future<void> getStat(GetHomeEvent<Stat> event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getStatUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(data: HomeData().copyWith(stat: res.data, isLoading: false)));
      },
      emit: emit,
    );
  }

  Future<void> getHyperStat(GetHomeEvent<HyperStat> event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getHyperStatUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(data: HomeData().copyWith(hyperStat: res.data, isLoading: false)));
      },
      emit: emit,
    );
  }

  Future<void> getPetEquipment(GetHomeEvent<PetEquipment> event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getPetEquipmentUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(data: HomeData().copyWith(petEquipment: res.data, isLoading: false)));
      },
      emit: emit,
    );
  }

  Future<void> getBeautyEquipment(GetHomeEvent<BeautyEquipment> event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getBeautyEquipmentUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(data: HomeData().copyWith(beautyEquipment: res.data, isLoading: false)));
      },
      emit: emit,
    );
  }

  Future<void> getAndroidEquipment(GetHomeEvent<AndroidEquipment> event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getAndroidEquipmentUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(data: HomeData().copyWith(androidEquipment: res.data, isLoading: false)));
      },
      emit: emit,
    );
  }

  Future<void> getSkillInfo(GetSkillEvent event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = SkillInfoParams(
          ocid: event.ocid,
          date: event.date,
          characterSkillGrade: event.characterSkillGrade,
        );
        final res = await _getSkillInfoUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(data: HomeData().copyWith(skillInfo: res.data, isLoading: false)));
      },
      emit: emit,
    );
  }

  Future<void> getLinkSkill(GetHomeEvent<LinkSkill> event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getLinkSkillUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(data: HomeData().copyWith(linkSkill: res.data, isLoading: false)));
      },
      emit: emit,
    );
  }

  Future<void> getVMatrixInfo(GetHomeEvent<VMatrixInfo> event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getVMatrixUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(data: HomeData().copyWith(vMatrixInfo: res.data, isLoading: false)));
      },
      emit: emit,
    );
  }

  Future<void> getHexaMatrixInfo(GetHomeEvent<HexaMatrixInfo> event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getHexaMatrixInfoUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(data: HomeData().copyWith(hexaMatrixInfo: res.data, isLoading: false)));
      },
      emit: emit,
    );
  }

  Future<void> getHexaMatrixStat(GetHomeEvent<HexaMatrixStat> event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getHexaMatrixStatUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(data: HomeData().copyWith(hexaMatrixStat: res.data, isLoading: false)));
      },
      emit: emit,
    );
  }

  Future<void> getStudioTopRecordInfo(GetHomeEvent event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getStudioUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(data: HomeData().copyWith(studioTopRecordInfo: res.data, isLoading: false)));
      },
      emit: emit,
    );
  }
}
