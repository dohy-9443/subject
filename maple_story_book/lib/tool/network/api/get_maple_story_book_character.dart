import 'package:injectable/injectable.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/network/network.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_maple_story_book_character.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 21..
/// Description      :
///

@singleton
class GetMapleStoryBookCharacterApi {
  final MapleStoryBookRestClient _client;

  const GetMapleStoryBookCharacterApi(this._client);

  static String defaultPath = '/maplestory/v1';
  static String defaultCharacterPath = '$defaultPath/character';

  Future<dynamic> getOcid({required String characterName}) {
    return _client.get<dynamic>('$defaultPath/id', queryParameters: {
      'character_name': characterName
    }).then((value) => value.data);
  }

  Future<dynamic> getCharacterBasic({required String ocid, DateTime? date}) {
    return _client.get<dynamic>(
      '$defaultCharacterPath/basic',
      queryParameters: {
        'ocid' : ocid,
        'date' : dateToString(date)
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getCharacterPopularity({required String ocid, DateTime? date}) {
    return _client.get<dynamic>(
      '$defaultCharacterPath/popularity',
      queryParameters: {
        'ocid' : ocid,
        'date' : dateToString(date)
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getCharacterStat({required String ocid, DateTime? date}) {
    return _client.get<dynamic>(
      '$defaultCharacterPath/stat',
      queryParameters: {
        'ocid' : ocid,
        'date' : dateToString(date)
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getCharacterHyperStat({required String ocid, DateTime? date}) {
    return _client.get<dynamic>(
      '$defaultCharacterPath/hyper-stat',
      queryParameters: {
        'ocid' : ocid,
        'date' : dateToString(date)
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getCharacterPropensity({required String ocid, DateTime? date}) {
    return _client.get<dynamic>(
      '$defaultCharacterPath/propensity',
      queryParameters: {
        'ocid' : ocid,
        'date' : dateToString(date)
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getCharacterAbility({required String ocid, DateTime? date}) {
    return _client.get<dynamic>('$defaultCharacterPath/ability',
      queryParameters: {
        'ocid': ocid,
        'date' : dateToString(date)
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getCharacterItemEquipment({required String ocid, DateTime? date}) {
    return _client.get<dynamic>(
      '$defaultCharacterPath/item-equipment',
      queryParameters: {
        'ocid' : ocid,
        'date' : dateToString(date)
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getCharacterCashItemEquipment({required String ocid, DateTime? date}) {
    return _client.get<dynamic>(
      '$defaultCharacterPath/cashitem-equipment',
      queryParameters: {
        'ocid' : ocid,
        'date' : dateToString(date)
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getCharacterSymbolEquipment({required String ocid, DateTime? date}) {
    return _client.get<dynamic>(
      '$defaultCharacterPath/symbol-equipment',
      queryParameters: {
        'ocid' : ocid,
        'date' : dateToString(date)
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getCharacterSetEffect({required String ocid, DateTime? date}) {
    return _client.get<dynamic>(
      '$defaultCharacterPath/set-effect',
      queryParameters: {
        'ocid' : ocid,
        'date' : dateToString(date)
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getCharacterBeautyEquipment({required String ocid, DateTime? date}) {
    return _client.get<dynamic>(
      '$defaultCharacterPath/beauty-equipment',
      queryParameters: {
        'ocid' : ocid,
        'date' : dateToString(date)
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getCharacterAndroidEquipment({required String ocid, DateTime? date}) {
    return _client.get<dynamic>(
      '$defaultCharacterPath/android-equipment',
      queryParameters: {
        'ocid' : ocid,
        'date' : dateToString(date)
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getCharacterPetEquipment({required String ocid, DateTime? date}) {
    return _client.get<dynamic>(
      '$defaultCharacterPath/pet-equipment',
      queryParameters: {
        'ocid' : ocid,
        'date' : dateToString(date)
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getCharacterSkill({required String ocid, DateTime? date, required String characterSkillGrade}) {
    return _client.get<dynamic>(
      '$defaultCharacterPath/skill',
      queryParameters: {
        'ocid' : ocid,
        'date' : dateToString(date),
        'character_skill_grade' : characterSkillGrade,
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getCharacterLinkSkill({required String ocid, DateTime? date}) {
    return _client.get<dynamic>(
      '$defaultCharacterPath/link-skill',
      queryParameters: {
        'ocid' : ocid,
        'date' : dateToString(date)
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getCharacterVMatrix({required String ocid, DateTime? date}) {
    return _client.get<dynamic>(
      '$defaultCharacterPath/vmatrix',
      queryParameters: {
        'ocid' : ocid,
        'date' : dateToString(date)
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getCharacterHexamatrix({required String ocid, DateTime? date}) {
    return _client.get<dynamic>(
      '$defaultCharacterPath/hexamatrix',
      queryParameters: {
        'ocid' : ocid,
        'date' : dateToString(date)
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getCharacterHexamatrixStat({required String ocid, DateTime? date}) {
    return _client.get<dynamic>(
      '$defaultCharacterPath/hexamatrix-stat',
      queryParameters: {
        'ocid' : ocid,
        'date' : dateToString(date)
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getCharacterStudio({required String ocid, DateTime? date}) {
    return _client.get<dynamic>(
      '$defaultCharacterPath/dojang',
      queryParameters: {
        'ocid' : ocid,
        'date' : dateToString(date)
      },
    ).then((value) => value.data);
  }
}
