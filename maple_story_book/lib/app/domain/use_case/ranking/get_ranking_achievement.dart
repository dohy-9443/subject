import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_ranking_achievement.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

class GetRankingAchievementUseCase implements IUseCase<ResultRest<RankingAchievement>, RankingAchievementParams> {
  final IRankingRepository _potentialRepository;

  GetRankingAchievementUseCase(this._potentialRepository);

  @override
  Future<ResultRest<RankingAchievement>> execute([RankingAchievementParams? params]) {
    final yesterday = DateTime.now().subtract(const Duration(hours: 30));

    final RankingAchievementParams input = params ?? RankingAchievementParams(date: yesterday);

    return _potentialRepository.getRankingAchievement(date: input.date, worldName: input.worldName, ocid: input.ocid, page: input.page);
  }
}

class RankingAchievementParams {
  final DateTime date;
  final String? worldName;
  final String? ocid;
  final int? page;

  RankingAchievementParams({required this.date, this.worldName = '', this.ocid = '', this.page = 1});
}