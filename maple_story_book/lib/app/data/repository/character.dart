import 'package:injectable/injectable.dart';
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

@injectable
class CharacterRepository with BaseResponse implements ICharacterRepository {

  final CharacterDataSource _characterDataSource;

  CharacterRepository(this._characterDataSource);

  @override
  Future<ResultRest<Ability>> getCharacterAbility({required String ocid, DateTime? date}) async {
    return handleApiResponse<Ability>(
      request: () => _characterDataSource.getCharacterAbility(ocid: ocid, date: date),
      fromJson: (json) => Ability.fromJson(json),
    );
  }

  @override
  Future<ResultRest<BasicInfo>> getCharacterBasic({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterBasic
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<BeautyEquipment>> getCharacterBeautyEquipment({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterBeautyEquipment
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<CashItemEquipment>> getCharacterCashItemEquipment({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterCashItemEquipment
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<HyperStat>> getCharacterHyperStat({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterHyperStat
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<ItemEquipment>> getCharacterItemEquipment({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterItemEquipment
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<Popularity>> getCharacterPopularity({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterPopularity
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<Propensity>> getCharacterPropensity({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterPropensity
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<SetEffect>> getCharacterSetEffect({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterSetEffect
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<Stat>> getCharacterStat({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterStat
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<SymbolEquipment>> getCharacterSymbolEquipment({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterSymbolEquipment
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<Ocid>> getOcid({required String characterName}) async {
    return handleApiResponse<Ocid>(
      request: () => _characterDataSource.getOcid(characterName: characterName),
      fromJson: (json) => Ocid.fromJson(json),
    );
  }

  @override
  Future<ResultRest<AndroidEquipment>> getCharacterAndroidEquipment({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterAndroidEquipment
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<HexaMatrixInfo>> getCharacterHexaMatrixInfo({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterHexaMatrixInfo
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<HexaMatrixStat>> getCharacterHexaMatrixStat({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterHexaMatrixStat
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<LinkSkill>> getCharacterLinkSkill({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterLinkSkill
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<PetEquipment>> getCharacterPetEquipment({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterPetEquipment
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<SkillInfo>> getCharacterSkillInfo({required String ocid, DateTime? date, required String characterSkillGrade}) {
    // TODO: implement getCharacterSkillInfo
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<StudioTopRecordInfo>> getCharacterStudioTopRecordInfo({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterStudioTopRecordInfo
    throw UnimplementedError();
  }

  @override
  Future<ResultRest<VMatrixInfo>> getCharacterVMatrixInfo({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterVMatrixInfo
    throw UnimplementedError();
  }



}