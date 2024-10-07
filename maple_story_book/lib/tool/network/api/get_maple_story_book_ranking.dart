import 'package:injectable/injectable.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/network/network.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_maple_story_book_ranking.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

@lazySingleton
class GetMapleStoryBookRankingApi {
  final MapleStoryBookRestClient _client;

  GetMapleStoryBookRankingApi(this._client);

  static String defaultPath = '/maplestory/v1/ranking';

  Future<dynamic> getRankingOverall({required DateTime date, String? worldName, String? worldType, String? AvailableValue, String? ocid, int? page}) {

    return _client.get<dynamic>(
      '$defaultPath/overall',
      queryParameters: {
        if (date != null) 'date' : dateToString(date),
        if (worldName != null && worldName.isNotEmpty) 'world_name': worldName,
        if (worldType != null && worldType.isNotEmpty) 'world_type': worldType,
        if (AvailableValue != null && AvailableValue.isNotEmpty) 'class': AvailableValue,
        if (ocid != null && ocid.isNotEmpty) 'ocid': ocid,
        if (page != null) 'page': page,
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getRankingUnion({required DateTime date, String? worldName, String? ocid, int? page}) {
    return _client.get<dynamic>(
      '$defaultPath/union',
      queryParameters: {
        if (date != null) 'date' : dateToString(date),
        if (worldName != null && worldName.isNotEmpty) 'world_name': worldName,
        if (ocid != null && ocid.isNotEmpty) 'ocid': ocid,
        if (page != null) 'page': page,
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getRankingGuild({required DateTime date, String? worldName, required int rankingType, String? guildName, int? page}) {
    return _client.get<dynamic>(
      '$defaultPath/guild',
      queryParameters: {
        if (date != null) 'date' : dateToString(date),
        if (worldName != null && worldName.isNotEmpty) 'world_name': worldName,
        'ranking_type' : rankingType,
        if (guildName != null && guildName.isNotEmpty) 'guild_name' : guildName,
        if (page != null) 'page': page,
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getRankingStudio({required DateTime date, String? worldName, required int difficulty, String? AvailableValue, String? ocid, int? page}) {
    return _client.get<dynamic>(
      '$defaultPath/dojang',
      queryParameters: {
        if (date != null) 'date' : dateToString(date),
        if (worldName != null && worldName.isNotEmpty) 'world_name': worldName,
        'difficulty' : difficulty,
        if (AvailableValue != null && AvailableValue.isNotEmpty) 'class' : AvailableValue,
        if (ocid != null && ocid.isNotEmpty) 'ocid': ocid,
        if (page != null) 'page': page,
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getRankingTheSeed({required DateTime date, String? worldName, String? ocid, int? page}) {
    return _client.get<dynamic>(
      '$defaultPath/theseed',
      queryParameters: {
        if (date != null) 'date' : dateToString(date),
        if (worldName != null && worldName.isNotEmpty) 'world_name': worldName,
        if (ocid != null && ocid.isNotEmpty) 'ocid': ocid,
        if (page != null) 'page': page,
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getRankingAchievement({required DateTime date, String? ocid, int? page}) {
    return _client.get<dynamic>(
      '$defaultPath/achievement',
      queryParameters: {
        if (date != null) 'date' : dateToString(date),
        if (ocid != null && ocid.isNotEmpty) 'ocid': ocid,
        if (page != null) 'page': page,
      },
    ).then((value) => value.data);
  }
}