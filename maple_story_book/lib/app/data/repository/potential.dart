import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/cube_history.dart';
import 'package:maple_story_book/app/domain/entity/potential_history.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/extension/base_response.dart';

///
/// @Project name    : maple_story_book
/// @Class           : potential.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 27..
/// Description      :
///

@lazySingleton
class PotentialRepository with BaseResponse implements IPotentialRepository {
  final PotentialDataSource _potentialDataSource;

  PotentialRepository(this._potentialDataSource);

  @override
  Future<ResultRest<CubeHistory>> getHistoryCube({required String count, DateTime? date, String? cursor}) {
    return handleApiResponse<CubeHistory>(request: () => _potentialDataSource.getHistoryCube(count: count, date: date, cursor: cursor), fromJson: (json) => CubeHistory.fromJson(json));
  }

  @override
  Future<ResultRest<PotentialHistory>> getHistoryPotential({required String count, DateTime? date, String? cursor}) {
    return handleApiResponse(request: () => _potentialDataSource.getHistoryPotential(count: count, date: date, cursor: cursor), fromJson: (json) => PotentialHistory.fromJson(json));
  }
}