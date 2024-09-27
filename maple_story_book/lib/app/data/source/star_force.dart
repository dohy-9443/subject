import 'package:injectable/injectable.dart';
import 'package:maple_story_book/tool/network/api/api.dart';

///
/// @Project name    : maple_story_book
/// @Class           : starforce.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 27..
/// Description      :
///

abstract class IGetStarForceDataSource {
  Future<dynamic> getHistoryStarForce({required String count, DateTime? date, String? cursor});
}

@lazySingleton
class StarForceDataSource implements IGetStarForceDataSource {
  final GetMapleStoryBookStarforceApi _api;

  StarForceDataSource(this._api);

  @override
  Future getHistoryStarForce({required String count, DateTime? date, String? cursor}) {
    return _api.getHistoryStarforce(count: count,date: date, cursor: cursor);
  }
}