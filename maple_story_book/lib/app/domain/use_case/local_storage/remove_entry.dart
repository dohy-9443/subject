import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/domain/repository/repository.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : remove_entry.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 3..
/// Description      : 
///

@singleton
class RemoveEntryUseCase implements IUseCase<void, RemoveEntryParams> {
  final ILocalStorageRepository _repository;

  RemoveEntryUseCase(this._repository);

  @override
  Future<void> execute([RemoveEntryParams? params]) async {
    if (params == null) throw Exception('parameter 가 꼭 있어야 합니다.');

    await _repository.removeEntry(params.category, params.nickname);
  }

}

class RemoveEntryParams {
  final String category;
  final String nickname;

  RemoveEntryParams({required this.category, required this.nickname});
}