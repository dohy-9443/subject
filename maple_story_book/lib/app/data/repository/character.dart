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

@lazySingleton
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
    return handleApiResponse<BasicInfo>(
      request: () => _characterDataSource.getCharacterBasic(ocid: ocid, date: date),
      fromJson: (json) => BasicInfo.fromJson(json),
    );
  }

  @override
  Future<ResultRest<BeautyEquipment>> getCharacterBeautyEquipment({required String ocid, DateTime? date}) {
    return handleApiResponse<BeautyEquipment>(
      request: () => _characterDataSource.getCharacterBeautyEquipment(ocid: ocid, date: date),
      fromJson: (json) => BeautyEquipment.fromJson(json),
    );
  }

  @override
  Future<ResultRest<CashItemEquipment>> getCharacterCashItemEquipment({required String ocid, DateTime? date}) {
    return handleApiResponse<CashItemEquipment>(
      request: () => _characterDataSource.getCharacterCashItemEquipment(ocid: ocid, date: date),
      fromJson: (json) => CashItemEquipment.fromJson(json),
    );
  }

  @override
  Future<ResultRest<HyperStat>> getCharacterHyperStat({required String ocid, DateTime? date}) {
    return handleApiResponse<HyperStat>(
      request: () => _characterDataSource.getCharacterHyperStat(ocid: ocid, date: date),
      fromJson: (json) => HyperStat.fromJson(json),
    );
  }

  @override
  Future<ResultRest<ItemEquipment>> getCharacterItemEquipment({required String ocid, DateTime? date}) {
    return handleApiResponse<ItemEquipment>(
      request: () => _characterDataSource.getCharacterItemEquipment(ocid: ocid, date: date),
      fromJson: (json) => ItemEquipment.fromJson(json),
    );
  }

  @override
  Future<ResultRest<Popularity>> getCharacterPopularity({required String ocid, DateTime? date}) {
    return handleApiResponse<Popularity>(
      request: () => _characterDataSource.getCharacterPopularity(ocid: ocid, date: date),
      fromJson: (json) => Popularity.fromJson(json),
    );
  }

  @override
  Future<ResultRest<Propensity>> getCharacterPropensity({required String ocid, DateTime? date}) {
    return handleApiResponse<Propensity>(
      request: () => _characterDataSource.getCharacterPropensity(ocid: ocid, date: date),
      fromJson: (json) => Propensity.fromJson(json),
    );
  }

  @override
  Future<ResultRest<SetEffect>> getCharacterSetEffect({required String ocid, DateTime? date}) {
    return handleApiResponse<SetEffect>(
      request: () => _characterDataSource.getCharacterSetEffect(ocid: ocid, date: date),
      fromJson: (json) => SetEffect.fromJson(json),
    );
  }

  @override
  Future<ResultRest<Stat>> getCharacterStat({required String ocid, DateTime? date}) {
    return handleApiResponse<Stat>(
      request: () => _characterDataSource.getCharacterStat(ocid: ocid, date: date),
      fromJson: (json) => Stat.fromJson(json),
    );
  }

  @override
  Future<ResultRest<SymbolEquipment>> getCharacterSymbolEquipment({required String ocid, DateTime? date}) {
    return handleApiResponse<SymbolEquipment>(
      request: () => _characterDataSource.getCharacterSymbolEquipment(ocid: ocid, date: date),
      fromJson: (json) => SymbolEquipment.fromJson(json),
    );
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
    return handleApiResponse<AndroidEquipment>(
      request: () => _characterDataSource.getCharacterAndroidEquipment(ocid: ocid, date: date),
      fromJson: (json) => AndroidEquipment.fromJson(json),
    );
  }

  @override
  Future<ResultRest<HexaMatrixInfo>> getCharacterHexaMatrixInfo({required String ocid, DateTime? date}) {
    return handleApiResponse<HexaMatrixInfo>(
      request: () => _characterDataSource.getCharacterHexamatrix(ocid: ocid, date: date),
      fromJson: (json) => HexaMatrixInfo.fromJson(json),
    );
  }

  @override
  Future<ResultRest<HexaMatrixStat>> getCharacterHexaMatrixStat({required String ocid, DateTime? date}) {
    return handleApiResponse<HexaMatrixStat>(
      request: () => _characterDataSource.getCharacterHexamatrixStat(ocid: ocid, date: date),
      fromJson: (json) => HexaMatrixStat.fromJson(json),
    );
  }

  @override
  Future<ResultRest<LinkSkill>> getCharacterLinkSkill({required String ocid, DateTime? date}) {
    return handleApiResponse<LinkSkill>(
      request: () => _characterDataSource.getCharacterLinkSkill(ocid: ocid, date: date),
      fromJson: (json) => LinkSkill.fromJson(json),
    );
  }

  @override
  Future<ResultRest<PetEquipment>> getCharacterPetEquipment({required String ocid, DateTime? date}) {
    return handleApiResponse<PetEquipment>(
      request: () => _characterDataSource.getCharacterPetEquipment(ocid: ocid, date: date),
      fromJson: (json) => PetEquipment.fromJson(json),
    );
  }

  @override
  Future<ResultRest<SkillInfo>> getCharacterSkillInfo({required String ocid, DateTime? date, required String characterSkillGrade}) {
    return handleApiResponse<SkillInfo>(
      request: () => _characterDataSource.getCharacterSkill(ocid: ocid, date: date, characterSkillGrade: characterSkillGrade),
      fromJson: (json) => SkillInfo.fromJson(json),
    );
  }

  @override
  Future<ResultRest<StudioTopRecordInfo>> getCharacterStudioTopRecordInfo({required String ocid, DateTime? date}) {
    return handleApiResponse<StudioTopRecordInfo>(
      request: () => _characterDataSource.getCharacterStudio(ocid: ocid, date: date),
      fromJson: (json) => StudioTopRecordInfo.fromJson(json),
    );
  }

  @override
  Future<ResultRest<VMatrixInfo>> getCharacterVMatrixInfo({required String ocid, DateTime? date}) {
    return handleApiResponse<VMatrixInfo>(
      request: () => _characterDataSource.getCharacterVMatrix(ocid: ocid, date: date),
      fromJson: (json) => VMatrixInfo.fromJson(json),
    );
  }
}