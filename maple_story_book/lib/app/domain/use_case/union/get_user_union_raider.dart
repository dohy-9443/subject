import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_user_union_raider.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 27..
/// Description      :
///

@injectable
class GetUserUnionRaiderUseCase implements IUseCase<ResultRest<UnionRaider>, BaseParams>{
  final IUnionRepository _unionRepository;

  GetUserUnionRaiderUseCase(this._unionRepository);

  @override
  Future<ResultRest<UnionRaider>> execute([BaseParams? params]) {
    final BaseParams input = params ?? BaseParams(date: DateTime.now());

    return _unionRepository.getUserUnionRaider(ocid: input.ocid, date:input.date);
  }
}