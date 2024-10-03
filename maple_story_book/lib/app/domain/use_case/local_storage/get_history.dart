import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/repository/repository.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_history.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 3..
/// Description      : 
///

@singleton
class GetHistoryUseCase implements IUseCase<List<LocalStorageModel>, GetHistoryParams> {
  final ILocalStorageRepository _repository;

  GetHistoryUseCase(this._repository);

  @override
  Future<List<LocalStorageModel>> execute([GetHistoryParams? params]) async {
    if (params == null) throw Exception('parameter 가 꼭 있어야 합니다.');

    return await _repository.getHistory(params.category);
  }

}

class GetHistoryParams {
  final String category;

  GetHistoryParams({required this.category});
}