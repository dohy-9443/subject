import 'package:maple_story_book/tool/network/api/api.dart';

///
/// @Project name    : maple_story_book
/// @Class           : ranking.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 27..
/// Description      :
///

abstract class IGetRankingDataSource {
  getRankingAchievement({required DateTime date, String? ocid, int? page});
  getRankingGuild({required DateTime date, String? worldName, required int rankingType, String? guildName, int? page});
  getRankingOverall({required DateTime date, String? worldName, String? worldType, String? AvailableValue, String? ocid, int? page});
  getRankingStudio({required DateTime date, String? worldName, required int difficulty, String? AvailableValue, String? ocid, int? page});
  getRankingTheSeed({required DateTime date, String? worldName, String? ocid, int? page});
  getRankingUnion({required DateTime date, String? worldName, String? ocid, int? page});
}

class RankingDataSource implements IGetRankingDataSource {
  final GetMapleStoryBookRankingApi _api;

  RankingDataSource(this._api);

  @override
  getRankingAchievement({required DateTime date, String? ocid, int? page}) {
    return _api.getRankingAchievement(date: date, ocid: ocid, page: page);
  }

  @override
  getRankingGuild({required DateTime date, String? worldName, required int rankingType, String? guildName, int? page}) {
    return _api.getRankingGuild(date: date, worldName: worldName, rankingType: rankingType, page: page);
  }

  @override
  getRankingOverall({required DateTime date, String? worldName, String? worldType, String? AvailableValue, String? ocid, int? page}) {
    return _api.getRankingOverall(date: date, worldName: worldName, worldType: worldType, AvailableValue: AvailableValue, ocid: ocid, page: page);
  }

  @override
  getRankingStudio({required DateTime date, String? worldName, required int difficulty, String? AvailableValue, String? ocid, int? page}) {
    return _api.getRankingStudio(date: date, worldName: worldName, difficulty: difficulty, AvailableValue: AvailableValue, ocid: ocid, page: page);
  }

  @override
  getRankingTheSeed({required DateTime date, String? worldName, String? ocid, int? page}) {
    return _api.getRankingTheSeed(date: date,worldName: worldName, ocid: ocid, page: page);
  }

  @override
  getRankingUnion({required DateTime date, String? worldName, String? ocid, int? page}) {
    return _api.getRankingUnion(date: date,worldName: worldName, ocid: ocid, page: page);
  }
}