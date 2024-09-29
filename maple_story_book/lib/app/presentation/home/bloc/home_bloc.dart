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
  final GetItemEquipmentUseCase _getItemEquipmentUseCase;
  final GetCashItemEquipmentUseCase _getCashItemEquipmentUseCase;
  final GetSetEffectUseCase _getSetEffectUseCase;
  final GetSymbolEquipmentUseCase _getSymbolEquipmentUseCase;
  final GetStatUseCase _getStatUseCase;
  final GetHyperStatUseCase _getHyperStatUseCase;
  final GetPetEquipmentUseCase _getPetEquipmentUseCase;

  HomeBloc(
    this._getAbilityUseCase,
    this._getCharacterBasicUseCase,
    this._getPropensityUseCase,
    this._getItemEquipmentUseCase,
    this._getCashItemEquipmentUseCase,
    this._getSetEffectUseCase,
    this._getSymbolEquipmentUseCase,
    this._getStatUseCase,
    this._getHyperStatUseCase,
    this._getPetEquipmentUseCase,
  ) : super(HomeInitial()) {
    on<GetHomeEvent<Ability>>(getAbility);
    on<GetHomeEvent<BasicInfo>>(getCharacterBasic);
    on<GetHomeEvent<Propensity>>(getPropensity);
    on<GetHomeEvent<ItemEquipment>>(getItemEquipment);
    on<GetHomeEvent<CashItemEquipment>>(getCashItemEquipment);
    on<GetHomeEvent<SetEffect>>(getSetEffect);
    on<GetHomeEvent<SymbolEquipment>>(getSymbolEquipment);
    on<GetHomeEvent<Stat>>(getStat);
    on<GetHomeEvent<HyperStat>>(getHyperStat);
    on<GetHomeEvent<PetEquipment>>(getPetEquipment);

    // add(GetHomeEvent<Ability>('bc9ba6b1f13451d74458a513aad3b494'));
    // add(GetHomeEvent<BasicInfo>('bc9ba6b1f13451d74458a513aad3b494'));
    // add(GetHomeEvent<Propensity>('bc9ba6b1f13451d74458a513aad3b494'));
    add(GetHomeEvent<ItemEquipment>('bc9ba6b1f13451d74458a513aad3b494'));
    // add(GetHomeEvent<CashItemEquipment>('bc9ba6b1f13451d74458a513aad3b494'));
    // add(GetHomeEvent<SetEffect>('bc9ba6b1f13451d74458a513aad3b494'));
    // add(GetHomeEvent<SymbolEquipment>('bc9ba6b1f13451d74458a513aad3b494'));
    // add(GetHomeEvent<Stat>('bc9ba6b1f13451d74458a513aad3b494'));
    // add(GetHomeEvent<HyperStat>('bc9ba6b1f13451d74458a513aad3b494'));
    // add(GetHomeEvent<PetEquipment>('bc9ba6b1f13451d74458a513aad3b494'));
  }

  Future<void> getAbility(GetHomeEvent event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getAbilityUseCase.execute(params);
        print('ocid : ${event.ocid}');
        print('res : ${res.data}');
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(ability: res.data, isLoading: false));
      },
      emit: emit,
    );

  }

  Future<void> getCharacterBasic(GetHomeEvent event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getCharacterBasicUseCase.execute(params);
        print('res : ${res.data}');
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(basicInfo: res.data, isLoading: false));
      },
      emit: emit,
    );
  }

  Future<void> getPropensity(GetHomeEvent event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getPropensityUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(propensity: res.data, isLoading: false));
      },
      emit: emit,
    );
  }

  Future<void> getItemEquipment(GetHomeEvent event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getItemEquipmentUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(itemEquipment: res.data, isLoading: false));
      },
      emit: emit,
    );
  }

  Future<void> getCashItemEquipment(GetHomeEvent event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getCashItemEquipmentUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(cashItemEquipment: res.data, isLoading: false));
      },
      emit: emit,
    );
  }

  Future<void> getSetEffect(GetHomeEvent event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getSetEffectUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(setEffect: res.data, isLoading: false));
      },
      emit: emit,
    );
  }

  Future<void> getSymbolEquipment(GetHomeEvent event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getSymbolEquipmentUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(symbolEquipment: res.data, isLoading: false));
      },
      emit: emit,
    );
  }

  Future<void> getStat(GetHomeEvent event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getStatUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(stat: res.data, isLoading: false));
      },
      emit: emit,
    );
  }

  Future<void> getHyperStat(GetHomeEvent event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getHyperStatUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(hyperStat: res.data, isLoading: false));
      },
      emit: emit,
    );
  }

  Future<void> getPetEquipment(GetHomeEvent event, Emitter<IHomeState> emit) async {
    await handleRequest(
      request: () async {
        final params = BaseParams(
          ocid: event.ocid,
          date: event.date,
        );
        final res = await _getPetEquipmentUseCase.execute(params);
        if (res.code != 200) throw Exception('code 200 이 아닙니다.');
        emit((state as HomeSuccess).copyWith(petEquipment: res.data, isLoading: false));
      },
      emit: emit,
    );
  }
}
