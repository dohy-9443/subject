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
  Future<ResultRest<Ocid>> getOcid({required String characterName});
  // 기본 정보 조회
  Future<ResultRest<BasicInfo>> getCharacterBasic({required String ocid, String? date});
  // 인기도 정보 조회
  Future<ResultRest<Popularity>> getCharacterPopularity({required String ocid, String? date});
  // 종합 능력치 정보 조회
  Future<ResultRest<Stat>> getCharacterStat({required String ocid, String? date});
  // 하이퍼스탯 정보 조회
  Future<ResultRest<HyperStat>> getCharacterHyperStat({required String ocid, String? date});
  // 성향 정보 조회
  Future<ResultRest<Propensity>> getCharacterPropensity({required String ocid, String? date});
  // 어빌리티 정보 조회
  Future<ResultRest<Ability>> getCharacterAbility({required String ocid, String? date});
  // 장착 장비 정보 조회 (캐시 장비 제외)
  Future<ResultRest<ItemEquipment>> getCharacterItemEquipment({required String ocid, String? date});
  // 장착 캐시 장비 정보 조회
  Future<ResultRest<CashItemEquipment>> getCharacterCashItemEquipment({required String ocid, String? date});
  // 장착 심볼 정보 조회
  Future<ResultRest<SymbolEquipment>> getCharacterSymbolEquipment({required String ocid, String? date});
  // 장착 세트 효과 정보 조회
  Future<ResultRest<SetEffect>> getCharacterSetEffect({required String ocid, String? date});
  // 장착 헤어, 성형, 피부 정보 조회
  Future<ResultRest<BeautyEquipment>> getCharacterBeautyEquipment({required String ocid, String? date});
}