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