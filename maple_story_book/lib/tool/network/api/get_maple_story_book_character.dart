import 'package:maple_story_book/tool/network/network.dart';

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

  Future<dynamic> getOcid() {
    return _client.get<dynamic>('$defaultPath/id').then((value) => value.data);
  }
}
