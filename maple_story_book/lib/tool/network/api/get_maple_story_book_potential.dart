import 'package:injectable/injectable.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/network/network.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_maple_story_book_potential.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

@lazySingleton
class GetMapleStoryBookPotentialApi {
  final MapleStoryBookRestClient _client;

  GetMapleStoryBookPotentialApi(this._client);

  static String defaultPath = '/maplestory/v1/history';

  Future<dynamic> getHistoryPotential({required String count, DateTime? date, String? cursor}) {
    return _client.get<dynamic>(
      '$defaultPath/potential',
      queryParameters: {
        'count' : count,
        if (date != null) 'date' : dateToString(date),
        'cursor' : cursor,
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getHistoryCube({required String count, DateTime? date, String? cursor}) {
    return _client.get<dynamic>(
      '$defaultPath/cube',
      queryParameters: {
        'count' : count,
        if (date != null) 'date' : dateToString(date),
        'cursor' : cursor,
      },
    ).then((value) => value.data);
  }
}