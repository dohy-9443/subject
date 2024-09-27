import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/starforce_history.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/extension/base_response.dart';

///
/// @Project name    : maple_story_book
/// @Class           : starforce.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 27..
/// Description      :
///

@lazySingleton
class StarforceRepository with BaseResponse implements IStarforceRepository {
  final IGetStarforceDataSource _starforceDataSource;

  StarforceRepository(this._starforceDataSource);

  @override
  Future<ResultRest<StarForceHistory>> getHistoryStarforce(
      {required String count, DateTime? date, String? cursor}) {
    return handleApiResponse<StarForceHistory>(
      request: () => _starforceDataSource.getHistoryStarforce(
          count: count, date: date, cursor: cursor),
      fromJson: (json) => StarForceHistory.fromJson(json),
    );
  }
}
