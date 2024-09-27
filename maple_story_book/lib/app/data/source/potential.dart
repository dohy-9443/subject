import 'package:injectable/injectable.dart';
import 'package:maple_story_book/tool/network/api/api.dart';

///
/// @Project name    : maple_story_book
/// @Class           : potential.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 27..
/// Description      :
///

abstract class IGetPotentialDataSource {
  getHistoryPotential({required String count, DateTime? date, String? cursor});
  getHistoryCube({required String count, DateTime? date, String? cursor});
}

@lazySingleton
class PotentialDataSource implements IGetPotentialDataSource {
  final GetMapleStoryBookPotentialApi _api;

  PotentialDataSource(this._api);

  @override
  getHistoryCube({required String count, DateTime? date, String? cursor}) {
    return _api.getHistoryCube(count: count, date: date, cursor: cursor);
  }

  @override
  getHistoryPotential({required String count, DateTime? date, String? cursor}) {
    return _api.getHistoryPotential(count: count, date: date, cursor: cursor);
  }
}

