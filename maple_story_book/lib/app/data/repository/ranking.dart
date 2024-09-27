import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/ranking_achievement.dart';
import 'package:maple_story_book/app/domain/entity/ranking_guild.dart';
import 'package:maple_story_book/app/domain/entity/ranking_overall.dart';
import 'package:maple_story_book/app/domain/entity/ranking_studio.dart';
import 'package:maple_story_book/app/domain/entity/ranking_the_seed.dart';
import 'package:maple_story_book/app/domain/entity/ranking_union.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/extension/base_response.dart';

///
/// @Project name    : maple_story_book
/// @Class           : ranking.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 27..
/// Description      :
///

@lazySingleton
class RankingRepository with BaseResponse implements IRankingRepository {
  final IGetRankingDataSource _rankingDataSource;

  RankingRepository(this._rankingDataSource);

  @override
  Future<ResultRest<RankingAchievement>> getRankingAchievement({
    required DateTime date,
    String? worldName,
    String? ocid,
    int? page,
  }) {
    return handleApiResponse<RankingAchievement>(
        request: () => _rankingDataSource.getRankingAchievement(date: date),
        fromJson: (json) => RankingAchievement.fromJson(json));
  }

  @override
  Future<ResultRest<RankingGuild>> getRankingGuild({
    required DateTime date,
    String? worldName,
    required int rankingType,
    String? guildName,
    int? page,
  }) {
    return handleApiResponse<RankingGuild>(
      request: () => _rankingDataSource.getRankingGuild(
        date: date,
        worldName: worldName,
        rankingType: rankingType,
        guildName: guildName,
        page: page,
      ),
      fromJson: (json) => RankingGuild.fromJson(json),
    );
  }

  @override
  Future<ResultRest<RankingOverall>> getRankingOverall({
    required DateTime date,
    String? worldName,
    String? worldType,
    String? availableValue,
    String? ocid,
    int? page,
  }) {
    return handleApiResponse<RankingOverall>(
      request: () => _rankingDataSource.getRankingOverall(
        date: date,
        worldName: worldName,
        worldType: worldType,
        AvailableValue: availableValue,
        ocid: ocid,
        page: page,
      ),
      fromJson: (json) => RankingOverall.fromJson(json),
    );
  }

  @override
  Future<ResultRest<RankingStudio>> getRankingStudio({
    required DateTime date,
    String? worldName,
    required int difficulty,
    String? availableValue,
    String? ocid,
    int? page,
  }) {
    return handleApiResponse<RankingStudio>(
      request: () => _rankingDataSource.getRankingStudio(
        date: date,
        worldName: worldName,
        difficulty: difficulty,
        AvailableValue: availableValue,
        ocid: ocid,
        page: page,
      ),
      fromJson: (json) => RankingStudio.fromJson(json),
    );
  }

  @override
  Future<ResultRest<RankingTheSeed>> getRankingTheSeed({
    required DateTime date,
    String? worldName,
    String? ocid,
    int? page,
  }) {
    return handleApiResponse<RankingTheSeed>(
      request: () => _rankingDataSource.getRankingTheSeed(
        date: date,
        worldName: worldName,
        ocid: ocid,
        page: page,
      ),
      fromJson: (json) => RankingTheSeed.fromJson(json),
    );
  }

  @override
  Future<ResultRest<RankingUnion>> getRankingUnion({
    required DateTime date,
    String? worldName,
    String? ocid,
    int? page,
  }) {
    return handleApiResponse<RankingUnion>(
      request: () => _rankingDataSource.getRankingUnion(
        date: date,
        worldName: worldName,
        ocid: ocid,
        page: page,
      ),
      fromJson: (json) => RankingUnion.fromJson(json),
    );
  }
}
