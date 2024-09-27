import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_ranking_union.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 27..
/// Description      :
///

class GetRankingUnionUseCase implements IUseCase<ResultRest<RankingUnion>, RankingParams> {
  final IRankingRepository _rankingRepository;

  GetRankingUnionUseCase(this._rankingRepository);

  @override
  Future<ResultRest<RankingUnion>> execute([RankingParams? params]) {
    final yesterday = DateTime.now().subtract(const Duration(hours: 30));

    final RankingParams input = params ?? RankingParams(date: yesterday);

    return _rankingRepository.getRankingUnion(date: input.date, worldName: input.worldName, ocid: input.ocid, page: input.page);
  }

}
