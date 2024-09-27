import 'package:injectable/injectable.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/network/network.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_maple_story_book_guild.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

@lazySingleton
class GetMapleStoryBookGuildApi {
  final MapleStoryBookRestClient _client;

  GetMapleStoryBookGuildApi(this._client);

  static String defaultPath = '/maplestory/v1/guild';

  Future<dynamic> getGuildId({required String guildName, required String worldName}) {
    return _client.get<dynamic>(
      '$defaultPath/id',
      queryParameters: {
        'guild_name' : guildName,
        'world_name' : worldName
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getGuildBasic({required String oguildId, DateTime? date}) {
    return _client.get<dynamic>(
      '$defaultPath/id',
      queryParameters: {
        'oguild_id' : oguildId,
        'date' : dateToString(date)
      },
    ).then((value) => value.data);
  }
}