import 'package:maple_story_book/tool/network/network.dart';

///
/// @Project name    : maple_story_book
/// @Class           : guild.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

abstract class IGetGuildDataSource {
  Future<dynamic> getGuildId({required String guildName, required String worldName});
  Future<dynamic> getGuildBasic({required String oguildId, DateTime? date});
}

class GuildDataSource implements IGetGuildDataSource {
  final GetMapleStoryBookGuildApi _api;

  GuildDataSource(this._api);

  @override
  Future getGuildBasic({required String oguildId, DateTime? date}) {
    return _api.getGuildBasic(oguildId: oguildId, date: date);
  }

  @override
  Future getGuildId({required String guildName, required String worldName}) {
    return _api.getGuildId(guildName: guildName, worldName: worldName);
  }
}