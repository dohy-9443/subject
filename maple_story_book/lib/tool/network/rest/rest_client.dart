import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:maple_story_book/core/network/network.dart';

///
/// @Project name    : maple_story_book
/// @Class           : rest_client.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 18..
/// Description      : 
///

String? baseUrl = dotenv.env['BASE_URL'];

class MapleStoryBookRestClient extends RestClient {

  MapleStoryBookRestClient() : super(baseUrl: baseUrl!);
}