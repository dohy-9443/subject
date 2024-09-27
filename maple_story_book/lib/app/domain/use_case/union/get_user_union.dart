import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_user_union.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 27..
/// Description      :
///

@injectable
class GetUserUnionUseCase implements IUseCase<ResultRest<UnionInfo>, BaseParams>{
  final IUnionRepository _unionRepository;

  GetUserUnionUseCase(this._unionRepository);

  @override
  Future<ResultRest<UnionInfo>> execute([BaseParams? params]) {
    final BaseParams input = params ?? BaseParams(date: DateTime.now());

    return _unionRepository.getUserUnion(ocid: input.ocid, date:input.date);
  }
}