import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/network/network.dart';
import 'package:retrofit/retrofit.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_maple_story_book_character.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 21..
/// Description      :
///

class GetMapleStoryBookCharacterApi {
  final MapleStoryBookRestClient _client;

  const GetMapleStoryBookCharacterApi(this._client);

  static String defaultPath = '/maplestory/v1';

  Future<dynamic> getOcid({required String characterName}) {
    return _client.get<dynamic>('$defaultPath/id', queryParameters: {
      'character_name': characterName
    }).then((value) => value.data);
  }

  Future<dynamic> getCharacterAbility({required String ocid, DateTime? date}) {

    return _client.get<dynamic>('$defaultPath/character/ability',
      queryParameters: {
        'ocid': ocid,
        'date': dateToString(date)
      },
    ).then((value) => value.data);
  }
}
