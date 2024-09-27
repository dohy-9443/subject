import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_ranking_the_seed.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 28..
/// Description      : 
///

@lazySingleton
class GetRankingTheSeedUseCase implements IUseCase<ResultRest<RankingTheSeed>, RankingParams> {
  final IRankingRepository _rankingRepository;

  GetRankingTheSeedUseCase(this._rankingRepository);

  @override
  Future<ResultRest<RankingTheSeed>> execute([RankingParams? params]) {
    final yesterday = DateTime.now().subtract(const Duration(hours: 30));

    final RankingParams input = params ?? RankingParams(date: yesterday);

    return _rankingRepository.getRankingTheSeed(date: input.date, worldName: input.worldName, ocid: input.ocid, page: input.page);
  }
}