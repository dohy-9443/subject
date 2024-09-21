import 'package:maple_story_book/tool/network/network.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_maple_story_book_character.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 21..
/// Description      : 
///

abstract class IGetRemoteDataSource {
  Future<dynamic> getOcid();
}

class GetRemoteDataSource implements IGetRemoteDataSource {
  final GetMapleStoryBookCharacterApi _api;

  GetRemoteDataSource(this._api);

  @override
  Future<dynamic> getOcid() {
    return _api.getOcid();
  }

}
