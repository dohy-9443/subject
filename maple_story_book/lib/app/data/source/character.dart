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
  Future<dynamic> getCharacterAbility({required String ocid, DateTime? date});
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

}