import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';

///
/// @Project name    : maple_story_book
/// @Class           : ranking.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 18..
/// Description      : rankingType, difficulty, class(availableValues) 직업 및 전직 enum 만들기
///



abstract class IRankingRepository {
  // 종합 랭킹 정보 조회
  Future<ResultRest<RankingOverall>> getRankingOverall({ required String count, String? date, String? cursor });
  // 유니온 랭킹 정보 조회
  Future<ResultRest<RankingUnion>> getRankingUnion({ required String date, String? worldName, String? ocid, int? page });
  // 길드 랭킹 정보 조회
  /// TODO : rankingType enum 만들기
  Future<ResultRest<RankingGuild>> getRankingGuild({ required String date, String? worldName, required int rankingType, String? guildName, int? page });
  // 무릉도장 랭킹 정보 조회
  /// TODO : difficulty enum 만들기
  /// TODO : class(availableValues) 직업 및 전직 enum 만들기
  Future<ResultRest<RankingStudio>> getRankingStudio({ required String date, String? worldName, required int difficulty, String? availableValue, String? ocid, int? page });
  // 더 시드 랭킹 정보 조회
  Future<ResultRest<RankingTheSeed>> getRankingTheSeed({ required String date, String? worldName, String? ocid, int? page });
  // 업적 랭킹 정보 조회
  Future<ResultRest<RankingAchievement>> getRankingAchievement({ required String date, String? worldName, String? ocid, int? page });
}