import 'package:maple_story_book/app/data/source/model/result.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';

///
/// @Project name    : maple_story_book
/// @Class           : character.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 18..
/// Description      : 
///

abstract class ICharacterRepository {
  // 캐릭터 정보 조회
  Future<ResultRest<Ocid>> getOcid();
  // 기본 정보 조회
  Future<ResultRest<BasicInfo>> getCharacterBasic();
  // 인기도 정보 조회
  Future<Popularity> getCharacterPopularity();
  // 종합 능력치 정보 조회
  Future<Stat> getCharacterStat();
}