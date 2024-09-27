import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_guild_id.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

class GetGuildIdUseCase implements IUseCase<ResultRest<GuildId>, GuildIdParams> {
  final IGuildRepository _guildRepository;

  GetGuildIdUseCase(this._guildRepository);

  @override
  Future<ResultRest<GuildId>> execute([GuildIdParams? params]) {
    final GuildIdParams input = params ?? GuildIdParams();

    return _guildRepository.getGuildId(guildName: input.guildName, worldName: input.worldName);
  }
}

class GuildIdParams {
  final String guildName;
  final String worldName;

  GuildIdParams({this.guildName = '', this.worldName = ''});
}