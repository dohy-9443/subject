import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_ranking_guild.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

@lazySingleton
class GetRankingGuildUseCase implements IUseCase<ResultRest<RankingGuild>, RankingGuildParams> {
  final IRankingRepository _potentialRepository;

  GetRankingGuildUseCase(this._potentialRepository);

  @override
  Future<ResultRest<RankingGuild>> execute([RankingGuildParams? params]) {
    final yesterday = DateTime.now().subtract(const Duration(hours: 30));

    final RankingGuildParams input = params ?? RankingGuildParams(date: yesterday);

    return _potentialRepository.getRankingGuild(date: input.date, worldName: input.worldName, rankingType: input.rankingType, guildName: input.guildName, page: input.page);
  }
}

class RankingGuildParams {
  final DateTime date;
  final String? worldName;
  final int rankingType;
  final String? guildName;
  final int? page;

  RankingGuildParams({required this.date, this.worldName = '', this.rankingType = 0, this.guildName = '', this.page = 1});
}