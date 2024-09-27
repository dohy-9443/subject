import 'package:maple_story_book/tool/network/api/api.dart';

///
/// @Project name    : maple_story_book
/// @Class           : character.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 21..
/// Description      : 
///

abstract class IGetCharacterDataSource {
  Future<dynamic> getOcid({required String characterName});
  Future<dynamic> getCharacterBasic({required String ocid, DateTime? date});
  Future<dynamic> getCharacterPopularity({required String ocid, DateTime? date});
  Future<dynamic> getCharacterStat({required String ocid, DateTime? date});
  Future<dynamic> getCharacterHyperStat({required String ocid, DateTime? date});
  Future<dynamic> getCharacterPropensity({required String ocid, DateTime? date});
  Future<dynamic> getCharacterAbility({required String ocid, DateTime? date});
  Future<dynamic> getCharacterItemEquipment({required String ocid, DateTime? date});
  Future<dynamic> getCharacterCashItemEquipment({required String ocid, DateTime? date});
  Future<dynamic> getCharacterSymbolEquipment({required String ocid, DateTime? date});
  Future<dynamic> getCharacterSetEffect({required String ocid, DateTime? date});
  Future<dynamic> getCharacterBeautyEquipment({required String ocid, DateTime? date});
  Future<dynamic> getCharacterAndroidEquipment({required String ocid, DateTime? date});
  Future<dynamic> getCharacterPetEquipment({required String ocid, DateTime? date});
  Future<dynamic> getCharacterSkill({required String ocid, DateTime? date, required String characterSkillGrade});
  Future<dynamic> getCharacterLinkSkill({required String ocid, DateTime? date});
  Future<dynamic> getCharacterVMatrix({required String ocid, DateTime? date});
  Future<dynamic> getCharacterHexamatrix({required String ocid, DateTime? date});
  Future<dynamic> getCharacterHexamatrixStat({required String ocid, DateTime? date});
  Future<dynamic> getCharacterStudio({required String ocid, DateTime? date});
}

class CharacterDataSource implements IGetCharacterDataSource {
  final GetMapleStoryBookCharacterApi _api;

  CharacterDataSource(this._api);

  @override
  Future<dynamic> getOcid({required String characterName}) {
    return _api.getOcid(characterName: characterName);
  }

  @override
  Future getCharacterAbility({required String ocid, DateTime? date}) {
    return _api.getCharacterAbility(ocid: ocid, date: date);
  }

  @override
  Future getCharacterAndroidEquipment({required String ocid, DateTime? date}) {
    return _api.getCharacterAndroidEquipment(ocid: ocid, date: date);
  }

  @override
  Future getCharacterBasic({required String ocid, DateTime? date}) {
    return _api.getCharacterBasic(ocid: ocid, date: date);
  }

  @override
  Future getCharacterBeautyEquipment({required String ocid, DateTime? date}) {
    return _api.getCharacterBeautyEquipment(ocid: ocid, date: date);
  }

  @override
  Future getCharacterCashItemEquipment({required String ocid, DateTime? date}) {
    return _api.getCharacterCashItemEquipment(ocid: ocid, date: date);
  }

  @override
  Future getCharacterHexamatrix({required String ocid, DateTime? date}) {
    return _api.getCharacterHexamatrix(ocid: ocid, date: date);
  }

  @override
  Future getCharacterHexamatrixStat({required String ocid, DateTime? date}) {
    return _api.getCharacterHexamatrixStat(ocid: ocid, date: date);
  }

  @override
  Future getCharacterHyperStat({required String ocid, DateTime? date}) {
    return _api.getCharacterHyperStat(ocid: ocid, date: date);
  }

  @override
  Future getCharacterItemEquipment({required String ocid, DateTime? date}) {
    return _api.getCharacterItemEquipment(ocid: ocid, date: date);
  }

  @override
  Future getCharacterLinkSkill({required String ocid, DateTime? date}) {
    return _api.getCharacterLinkSkill(ocid: ocid, date: date);
  }

  @override
  Future getCharacterPetEquipment({required String ocid, DateTime? date}) {
    return _api.getCharacterPetEquipment(ocid: ocid, date: date);
  }

  @override
  Future getCharacterPopularity({required String ocid, DateTime? date}) {
    return _api.getCharacterPopularity(ocid: ocid, date: date);
  }

  @override
  Future getCharacterPropensity({required String ocid, DateTime? date}) {
    return _api.getCharacterPropensity(ocid: ocid, date: date);
  }

  @override
  Future getCharacterSetEffect({required String ocid, DateTime? date}) {
    return _api.getCharacterSetEffect(ocid: ocid, date: date);
  }

  @override
  Future getCharacterSkill({required String ocid, DateTime? date, required String characterSkillGrade}) {
    return _api.getCharacterSkill(ocid: ocid, date: date, characterSkillGrade: characterSkillGrade);
  }

  @override
  Future getCharacterStat({required String ocid, DateTime? date}) {
    return _api.getCharacterStat(ocid: ocid, date: date);
  }

  @override
  Future getCharacterStudio({required String ocid, DateTime? date}) {
    return _api.getCharacterStudio(ocid: ocid, date: date);
  }

  @override
  Future getCharacterSymbolEquipment({required String ocid, DateTime? date}) {
    return _api.getCharacterSymbolEquipment(ocid: ocid, date: date);
  }

  @override
  Future getCharacterVMatrix({required String ocid, DateTime? date}) {
    return _api.getCharacterVMatrix(ocid: ocid, date: date);
  }

}