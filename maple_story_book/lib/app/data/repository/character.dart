import 'package:dio/dio.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/repository.dart';
import 'package:maple_story_book/core/extension/base_response.dart';

///
/// @Project name    : maple_story_book
/// @Class           : character.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 21..
/// Description      : 
///

class CharacterRepository with BaseResponse implements ICharacterRepository {

  final CharacterDataSource _characterDataSource;

  CharacterRepository(this._characterDataSource);

  @override
  Future<ResultRest<Ability>> getCharacterAbility({required String ocid, String? date}) {
    // TODO: implement getCharacterAbility
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<BasicInfo>> getCharacterBasic({required String ocid, String? date}) {
    // TODO: implement getCharacterBasic
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<BeautyEquipment>> getCharacterBeautyEquipment({required String ocid, String? date}) {
    // TODO: implement getCharacterBeautyEquipment
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<CashItemEquipment>> getCharacterCashItemEquipment({required String ocid, String? date}) {
    // TODO: implement getCharacterCashItemEquipment
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<HyperStat>> getCharacterHyperStat({required String ocid, String? date}) {
    // TODO: implement getCharacterHyperStat
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<ItemEquipment>> getCharacterItemEquipment({required String ocid, String? date}) {
    // TODO: implement getCharacterItemEquipment
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<Popularity>> getCharacterPopularity({required String ocid, String? date}) {
    // TODO: implement getCharacterPopularity
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<Propensity>> getCharacterPropensity({required String ocid, String? date}) {
    // TODO: implement getCharacterPropensity
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<SetEffect>> getCharacterSetEffect({required String ocid, String? date}) {
    // TODO: implement getCharacterSetEffect
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<Stat>> getCharacterStat({required String ocid, String? date}) {
    // TODO: implement getCharacterStat
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<SymbolEquipment>> getCharacterSymbolEquipment({required String ocid, String? date}) {
    // TODO: implement getCharacterSymbolEquipment
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<Ocid>> getOcid({required String characterName}) async {
    final json = await _characterDataSource.getOcid(characterName: characterName);

    try {
      if (json == null) throw Error<Ocid>(0, 'Received null data', Exception('Data is null'));

      print('여기임 ${Ocid.fromJson(json)}');

      return Success<Ocid>(Ocid.fromJson(json));
    } on DioException catch (e) {

      // Logger로 에러 정보 출력
      logger.e('DioException : ${e.message}');
      logger.e('Request Data: ${e.requestOptions.data}');
      logger.e('Error: ${e.error}');

      // HTTP 응답이 있으면 해당 응답의 코드와 메시지 처리
      if (e.response != null) {
        return Error<Ocid>(
          e.response!.statusCode ?? 0, // HTTP 응답 코드
          e.response!.statusMessage ?? 'Unknown error', // 응답 메시지
          e,
        );
      }

      // HTTP 응답이 없으면 기본 오류 메시지 반환
      return Error<Ocid>(0, 'No Response from Server', e);

    } catch (e) {
      // 기타 예외 처리 (DioException 외 다른 오류)
      logger.e('Unknown error: $e');

      return Error<Ocid>(0, 'Unknown error occurred', Exception(e.toString()));
    }
  }



}