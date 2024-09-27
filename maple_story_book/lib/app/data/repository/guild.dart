import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/repository.dart';
import 'package:maple_story_book/core/extension/base_response.dart';

///
/// @Project name    : maple_story_book
/// @Class           : guild.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

class GuildRepository with BaseResponse implements IGuildRepository {
  final GuildDataSource _guildDataSource;

  GuildRepository(this._guildDataSource);

  @override
  Future<ResultRest<GuildBasicInfo>> getGuildBasic({required String oGuildId, DateTime? date}) {
    return handleApiResponse<GuildBasicInfo>(
      request: () => _guildDataSource.getGuildBasic(oguildId: oGuildId, date: date),
      fromJson: (json) => GuildBasicInfo.fromJson(json),
    );
  }

  @override
  Future<ResultRest<GuildId>> getGuildId({required String guildName, required String worldName}) {
    return handleApiResponse<GuildId>(
      request: () => _guildDataSource.getGuildId(guildName: guildName, worldName: worldName),
      fromJson: (json) => GuildId.fromJson(json),
    );
  }
}