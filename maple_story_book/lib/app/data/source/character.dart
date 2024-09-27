import 'package:maple_story_book/tool/network/api/api.dart';

///
/// @Project name    : maple_story_book
/// @Class           : character.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 21..
/// Description      : 
///

abstract class IGetDataSource {
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

class CharacterDataSource implements IGetDataSource {
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
    // TODO: implement getCharacterAndroidEquipment
    throw UnimplementedError();
  }

  @override
  Future getCharacterBasic({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterBasic
    throw UnimplementedError();
  }

  @override
  Future getCharacterBeautyEquipment({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterBeautyEquipment
    throw UnimplementedError();
  }

  @override
  Future getCharacterCashItemEquipment({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterCashItemEquipment
    throw UnimplementedError();
  }

  @override
  Future getCharacterHexamatrix({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterHexamatrix
    throw UnimplementedError();
  }

  @override
  Future getCharacterHexamatrixStat({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterHexamatrixStat
    throw UnimplementedError();
  }

  @override
  Future getCharacterHyperStat({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterHyperStat
    throw UnimplementedError();
  }

  @override
  Future getCharacterItemEquipment({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterItemEquipment
    throw UnimplementedError();
  }

  @override
  Future getCharacterLinkSkill({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterLinkSkill
    throw UnimplementedError();
  }

  @override
  Future getCharacterPetEquipment({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterPetEquipment
    throw UnimplementedError();
  }

  @override
  Future getCharacterPopularity({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterPopularity
    throw UnimplementedError();
  }

  @override
  Future getCharacterPropensity({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterPropensity
    throw UnimplementedError();
  }

  @override
  Future getCharacterSetEffect({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterSetEffect
    throw UnimplementedError();
  }

  @override
  Future getCharacterSkill({required String ocid, DateTime? date, required String characterSkillGrade}) {
    // TODO: implement getCharacterSkill
    throw UnimplementedError();
  }

  @override
  Future getCharacterStat({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterStat
    throw UnimplementedError();
  }

  @override
  Future getCharacterStudio({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterStudio
    throw UnimplementedError();
  }

  @override
  Future getCharacterSymbolEquipment({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterSymbolEquipment
    throw UnimplementedError();
  }

  @override
  Future getCharacterVMatrix({required String ocid, DateTime? date}) {
    // TODO: implement getCharacterVMatrix
    throw UnimplementedError();
  }

}