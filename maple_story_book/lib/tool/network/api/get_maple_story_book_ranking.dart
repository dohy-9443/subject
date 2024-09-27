import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/network/network.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_maple_story_book_ranking.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

class GetMapleStoryBookRankingApi {
  final MapleStoryBookRestClient _client;

  GetMapleStoryBookRankingApi(this._client);

  static String defaultPath = '/maplestory/v1/ranking';

  Future<dynamic> getRankingOverall({required DateTime date, String? worldName, String? worldType, String? AvailableValue, String? ocid, int? page}) {
    return _client.get<dynamic>(
      '$defaultPath/overall',
      queryParameters: {
        'date' : dateToString(date),
        'world_name' : worldName,
        'world_type' : worldType,
        'class' : AvailableValue,
        'ocid' : ocid,
        'page' : page,
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getRankingUnion({required DateTime date, String? worldName, String? ocid, int? page}) {
    return _client.get<dynamic>(
      '$defaultPath/union',
      queryParameters: {
        'date' : dateToString(date),
        'world_name' : worldName,
        'ocid' : ocid,
        'page' : page,
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getRankingGuild({required DateTime date, String? worldName, required int rankingType, String? guildName, int? page}) {
    return _client.get<dynamic>(
      '$defaultPath/guild',
      queryParameters: {
        'date' : dateToString(date),
        'world_name' : worldName,
        'ranking_type' : rankingType,
        'guild_name' : guildName,
        'page' : page,
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getRankingStudio({required DateTime date, String? worldName, required int difficulty, String? AvailableValue, String? ocid, int? page}) {
    return _client.get<dynamic>(
      '$defaultPath/dojang',
      queryParameters: {
        'date' : dateToString(date),
        'world_name' : worldName,
        'difficulty' : difficulty,
        'class' : AvailableValue,
        'ocid' : ocid,
        'page' : page,
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getRankingTheSeed({required DateTime date, String? worldName, String? ocid, int? page}) {
    return _client.get<dynamic>(
      '$defaultPath/theseed',
      queryParameters: {
        'date' : dateToString(date),
        'world_name' : worldName,
        'ocid' : ocid,
        'page' : page,
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getRankingAchievement({required DateTime date, String? ocid, int? page}) {
    return _client.get<dynamic>(
      '$defaultPath/achievement',
      queryParameters: {
        'date' : dateToString(date),
        'ocid' : ocid,
        'page' : page,
      },
    ).then((value) => value.data);
  }
}