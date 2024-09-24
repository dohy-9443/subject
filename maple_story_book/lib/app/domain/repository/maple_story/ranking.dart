import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';

///
/// @Project name    : maple_story_book
/// @Class           : ranking.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 18..
/// Description      :
///



abstract class IRankingRepository {
  // 종합 랭킹 정보 조회
  Future<ResultRest<RankingOverall>> getRankingOverall({ required DateTime date, String? worldName, int? worldType, String? availableValue, String? ocid, int page, });
  // 유니온 랭킹 정보 조회
  Future<ResultRest<RankingUnion>> getRankingUnion({ required DateTime date, String? worldName, String? ocid, int? page });
  // 길드 랭킹 정보 조회
  Future<ResultRest<RankingGuild>> getRankingGuild({ required DateTime date, String? worldName, required int rankingType, String? guildName, int? page });
  // 무릉도장 랭킹 정보 조회
  Future<ResultRest<RankingStudio>> getRankingStudio({ required DateTime date, String? worldName, required int difficulty, String? availableValue, String? ocid, int? page });
  // 더 시드 랭킹 정보 조회
  Future<ResultRest<RankingTheSeed>> getRankingTheSeed({ required DateTime date, String? worldName, String? ocid, int? page });
  // 업적 랭킹 정보 조회
  Future<ResultRest<RankingAchievement>> getRankingAchievement({ required DateTime date, String? worldName, String? ocid, int? page });
}