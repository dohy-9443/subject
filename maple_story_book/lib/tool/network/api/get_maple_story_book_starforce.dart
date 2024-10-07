import 'package:injectable/injectable.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/network/network.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_maple_story_book_starforce.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

@lazySingleton
class GetMapleStoryBookStarforceApi {
  final MapleStoryBookRestClient _client;

  GetMapleStoryBookStarforceApi(this._client);

  static String defaultPath = '/maplestory/v1/history/starforce';

  Future<dynamic> getHistoryStarforce({required String count, DateTime? date, String? cursor}) {
    return _client.get<dynamic>(
      defaultPath,
      queryParameters: {
        'count' : count,
        if (date != null) 'date' : dateToString(date),
        'cursor' : cursor,
      },
    ).then((value) => value.data);
  }
}