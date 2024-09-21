import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';

///
/// @Project name    : maple_story_book
/// @Class           : potential.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 18..
/// Description      : 
///

abstract class IPotentialRepository {
  // 잠재능력 재설정 이용 결과 조회
  Future<ResultRest<PotentialHistory>> getHistoryPotential({ required String count, DateTime? date, String? cursor });
  // 큐브 사용 결과 조회
  Future<ResultRest<CubeHistory>> getHistoryCube({ required String count, DateTime? date, String? cursor });
}