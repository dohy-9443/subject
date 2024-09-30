import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/model/model.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/use_case/use_case.dart';
import 'package:maple_story_book/app/presentation/ranking/bloc/ranking_state.dart';
import 'package:maple_story_book/app/presentation/ranking/extension/ranking_extension.dart';

import 'ranking_event.dart';

///
/// @Project name    : maple_story_book
/// @Class           : ranking_bloc.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 30..
/// Description      :
///

@singleton
class RankingBloc extends Bloc<IRankingEvent, IRankingState>
    with RankingBlocMixin {
  final GetRankingAchievementUseCase _getRankingAchievementUseCase;
  final GetRankingGuildUseCase _getRankingGuildUseCase;
  final GetRankingOverallUseCase _getRankingOverallUseCase;
  final GetRankingStudioUseCase _getRankingStudioUseCase;
  final GetRankingTheSeedUseCase _getRankingTheSeedUseCase;
  final GetRankingUnionUseCase _getRankingUnionUseCase;

  RankingBloc(
    this._getRankingAchievementUseCase,
    this._getRankingGuildUseCase,
    this._getRankingOverallUseCase,
    this._getRankingStudioUseCase,
    this._getRankingTheSeedUseCase,
    this._getRankingUnionUseCase,
  ) : super(RankingInitial()) {
    on<GetRankingEvent<RankingAchievement>>(getRankingAchievement);
    on<GetRankingGuildEvent<RankingGuild>>(getRankingGuild);
    on<GetRankingOverallEvent<RankingOverall>>(getRankingOverall);
    on<GetRankingStudioEvent<RankingStudio>>(getRankingStudio);
    on<GetRankingEvent<RankingTheSeed>>(getRankingTheSeed);
    on<GetRankingEvent<RankingUnion>>(getRankingUnion);
  }
  
  Future<void> getRankingAchievement(
      GetRankingEvent event, Emitter<IRankingState> emit) async {
    final params = RankingParams(
      date: event.date,
      worldName: event.worldName,
      ocid: event.ocid,
      page: event.page,
    );

    final res = await _getRankingAchievementUseCase.execute(params);
    if (res.code != 200) throw Exception('code 200 이 아닙니다.');
    emit((state as RankingSuccess)
        .copyWith(rankingAchievement: res.data, isLoading: false));
  }

  Future<void> getRankingGuild(
      GetRankingGuildEvent event, Emitter<IRankingState> emit) async {
    final params = RankingGuildParams(
      date: event.date,
      worldName: event.worldName,
      rankingType: event.rankingType,
      guildName: event.guildName,
      page: event.page,
    );
    final res = await _getRankingGuildUseCase.execute(params);
    if (res.code != 200) throw Exception('code 200 이 아닙니다.');
    emit((state as RankingSuccess)
        .copyWith(rankingGuild: res.data, isLoading: false));
  }

  Future<void> getRankingOverall(
      GetRankingOverallEvent event, Emitter<IRankingState> emit) async {
    final params = RankingOverallParams(
      date: event.date,
      worldName: event.worldName,
      worldType: event.worldType,
      availableValue: event.availableValue,
      ocid: event.ocid,
      page: event.page,
    );
    final res = await _getRankingOverallUseCase.execute(params);
    if (res.code != 200) throw Exception('code 200 이 아닙니다.');
    emit((state as RankingSuccess)
        .copyWith(rankingOverall: res.data, isLoading: false));
  }

  Future<void> getRankingStudio(
      GetRankingStudioEvent event, Emitter<IRankingState> emit) async {
    final params = RankingStudioParams(
     date: event.date,
     worldName: event.worldName,
     difficulty: event.difficulty,
     availableValue: event.availableValue,
     ocid: event.ocid,
     page: event.page,
    );

    final res = await _getRankingStudioUseCase.execute(params);
    if (res.code != 200) throw Exception('code 200 이 아닙니다.');
    emit((state as RankingSuccess)
        .copyWith(rankingStudio: res.data, isLoading: false));
  }

  Future<void> getRankingTheSeed(
      GetRankingEvent event, Emitter<IRankingState> emit) async {
    final params = RankingParams(
      date: event.date,
      worldName: event.worldName,
      ocid: event.ocid,
      page: event.page,
    );

    final res = await _getRankingTheSeedUseCase.execute(params);
    if (res.code != 200) throw Exception('code 200 이 아닙니다.');
    emit((state as RankingSuccess).copyWith(rankingTheSeed: res.data, isLoading: false));
  }

  Future<void> getRankingUnion(
      GetRankingEvent event, Emitter<IRankingState> emit) async {
    final params = RankingParams(
      date: event.date,
      worldName: event.worldName,
      ocid: event.ocid,
      page: event.page,
    );

    final res = await _getRankingUnionUseCase.execute(params);
    if (res.code != 200) throw Exception('code 200 이 아닙니다.');
    emit((state as RankingSuccess).copyWith(rankingUnion: res.data,isLoading: false));
  }
}
