import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_ranking_studio.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

@lazySingleton
class GetRankingStudioUseCase implements IUseCase<ResultRest<RankingStudio>, RankingStudioParams> {
  final IRankingRepository _potentialRepository;

  GetRankingStudioUseCase(this._potentialRepository);

  @override
  Future<ResultRest<RankingStudio>> execute([RankingStudioParams? params]) {
    final yesterday = DateTime.now().subtract(const Duration(hours: 30));

    final RankingStudioParams input = params ?? RankingStudioParams(date: yesterday);

    return _potentialRepository.getRankingStudio(date: input.date, worldName: input.worldName, difficulty: input.difficulty, availableValue: input.availableValue, ocid: input.ocid, page: input.page);
  }
}

class RankingStudioParams {
  final DateTime date;
  final String? worldName;
  final int difficulty;
  final String? availableValue;
  final String? ocid;
  final int? page;

  RankingStudioParams({required this.date, this.worldName = '', this.difficulty = 0, this.availableValue = '', this.ocid = '', this.page = 1});
}