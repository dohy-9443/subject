import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_stat.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

@singleton
class GetStatUseCase implements IUseCase<ResultRest<Stat>, BaseParams> {
  final ICharacterRepository _characterRepository;

  GetStatUseCase(this._characterRepository);

  @override
  Future<ResultRest<Stat>> execute([BaseParams? params]) {
    final BaseParams input = params ?? BaseParams(date: DateTime.now());

    return _characterRepository.getCharacterStat(ocid: input.ocid, date: input.date);
  }
}