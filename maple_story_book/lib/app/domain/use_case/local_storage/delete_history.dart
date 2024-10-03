import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/domain/repository/repository.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : delete_history.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 3..
/// Description      : 
///

@singleton
class DeleteHistoryUseCase implements IUseCase<void, DeleteHistoryParams> {
  final ILocalStorageRepository _repository;

  DeleteHistoryUseCase(this._repository);

  @override
  Future<void> execute([DeleteHistoryParams? params]) async {
    if (params == null) throw Exception('parameter 가 꼭 있어야 합니다.');

    await _repository.deleteHistory(params.category);
  }

}

class DeleteHistoryParams {
  final String category;

  DeleteHistoryParams({required this.category});
}