import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/repository/repository.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : save_history.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 3..
/// Description      : 
///

@singleton
class SaveHistoryUseCase implements IUseCase<void, SaveHistoryParams> {
  final ILocalStorageRepository _repository;

  SaveHistoryUseCase(this._repository);

  @override
  Future<void> execute([SaveHistoryParams? params]) async {
    if (params == null) throw Exception('parameter 가 꼭 있어야 합니다.');

    await _repository.addEntry(params.category, params.entry);
  }

}

class SaveHistoryParams {
  final String category;
  final LocalStorageModel entry;

  SaveHistoryParams({required this.category, required this.entry});
}
