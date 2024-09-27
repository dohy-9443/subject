import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_ranking_overall.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

class GetRankingOverallUseCase implements IUseCase<ResultRest<RankingOverall>, RankingOverallParams> {
  final IRankingRepository _potentialRepository;

  GetRankingOverallUseCase(this._potentialRepository);

  @override
  Future<ResultRest<RankingOverall>> execute([RankingOverallParams? params]) {
    final yesterday = DateTime.now().subtract(const Duration(hours: 30));

    final RankingOverallParams input = params ?? RankingOverallParams(date: yesterday);

    return _potentialRepository.getRankingOverall(date: input.date, worldName: input.worldName, worldType: input.worldType, availableValue: input.availableValue, ocid: input.ocid, page: input.page);
  }
}

class RankingOverallParams {
  final DateTime date;
  final String? worldName;
  final String? worldType;
  final String? availableValue;
  final String? ocid;
  final int? page;

  RankingOverallParams({required this.date, this.worldName = '', this.worldType = '', this.availableValue = '', this.ocid = '', this.page = 1});
}