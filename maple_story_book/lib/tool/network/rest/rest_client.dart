import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:maple_story_book/core/network/network.dart';

///
/// @Project name    : maple_story_book
/// @Class           : rest_client.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 18..
/// Description      : 
///

class MapleStoryBookRestClient extends RestClient {
  MapleStoryBookRestClient() : super(baseUrl: 'https://open.api.nexon.com');
}