import 'package:injectable/injectable.dart';
import 'package:maple_story_book/core/util/util.dart';
import 'package:maple_story_book/tool/network/network.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_maple_story_book_union.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

@lazySingleton
class GetMapleStoryBookUnionApi {
  final MapleStoryBookRestClient _client;

  GetMapleStoryBookUnionApi(this._client);

  static String defaultPath = '/maplestory/v1/user/union';


  Future<dynamic> getUserUnion({required String ocid, DateTime? date}) {
    return _client.get<dynamic>(
      defaultPath,
      queryParameters: {
        'ocid' : ocid,
        'date' : dateToString(date)
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getUserUnionRaider({required String ocid, DateTime? date}) {
    return _client.get<dynamic>(
      '$defaultPath-raider',
      queryParameters: {
        'ocid' : ocid,
        'date' : dateToString(date)
      },
    ).then((value) => value.data);
  }

  Future<dynamic> getUserUnionArtifact({required String ocid, DateTime? date}) {
    return _client.get<dynamic>(
      '$defaultPath-artifact',
      queryParameters: {
        'ocid' : ocid,
        'date' : dateToString(date)
      },
    ).then((value) => value.data);
  }
}