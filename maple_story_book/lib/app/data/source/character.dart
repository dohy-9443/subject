import 'package:maple_story_book/app/data/source/source.dart';

///
/// @Project name    : maple_story_book
/// @Class           : character.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 21..
/// Description      : 
///

class CharacterDataSource {
  final IGetRemoteDataSource _getRemoteDataSource;

  CharacterDataSource(this._getRemoteDataSource);

  Future<dynamic> getOcid({ required String characterName }) {
    return _getRemoteDataSource.getOcid(characterName: characterName);
  }

  Future<dynamic> getCharacterAbility({required String ocid, DateTime? date}) {
    return _getRemoteDataSource.getCharacterAbility(ocid: ocid, date: date);
  }
}