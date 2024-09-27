import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_guild_basic.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

@lazySingleton
class GetGuildBasicUseCase implements IUseCase<ResultRest<GuildBasicInfo>, GuildBasicParams> {
  final IGuildRepository _guildRepository;

  GetGuildBasicUseCase(this._guildRepository);

  @override
  Future<ResultRest<GuildBasicInfo>> execute([GuildBasicParams? params]) {
    final GuildBasicParams input = params ?? GuildBasicParams(date: DateTime.now());

    return _guildRepository.getGuildBasic(oGuildId: input.oGuildId, date: input.date);
  }
}

class GuildBasicParams {
  final String oGuildId;
  DateTime? date;

  GuildBasicParams({this.oGuildId = '', this.date});
}