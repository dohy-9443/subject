import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';

///
/// @Project name    : maple_story_book
/// @Class           : union.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 18..
/// Description      : 
///

abstract class IUnionRepository {
  // 유니온 정보 조회
  Future<ResultRest<UnionInfo>> getUserUnion({ required String ocid, DateTime? date });
  // 유니온 공격대 정보 조회
  Future<ResultRest<UnionRaider>> getUserUnionRaider({ required String ocid, DateTime? date });
  // 유니온 아티팩트 정보 조회
  Future<ResultRest<UnionArtifact>> getUserUnionArtifact({ required String ocid, DateTime? date });
}