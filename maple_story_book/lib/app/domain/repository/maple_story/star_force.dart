import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';

///
/// @Project name    : maple_story_book
/// @Class           : starforce.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 18..
/// Description      : 
///

abstract class IStarForceRepository {
  // 스타포스 강화 결과 조회
  Future<ResultRest<StarForceHistory>> getHistoryStarForce({ required String count, DateTime? date, String? cursor });
}