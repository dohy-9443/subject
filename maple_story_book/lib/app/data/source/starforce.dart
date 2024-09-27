import 'package:maple_story_book/tool/network/api/api.dart';

///
/// @Project name    : maple_story_book
/// @Class           : starforce.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 27..
/// Description      :
///

abstract class IGetStarforceDataSource {
  Future<dynamic> getHistoryStarforce({required String count, DateTime? date, String? cursor});
}

class StarforceDataSource implements IGetStarforceDataSource {
  final GetMapleStoryBookStarforceApi _api;

  StarforceDataSource(this._api);

  @override
  Future getHistoryStarforce({required String count, DateTime? date, String? cursor}) {
    return _api.getHistoryStarforce(count: count,date: date,cursor: cursor);
  }
}