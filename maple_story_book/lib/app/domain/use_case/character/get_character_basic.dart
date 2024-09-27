import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_character_basic.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

@singleton
class GetCharacterBasicUseCase implements IUseCase<ResultRest<BasicInfo>, BaseParams> {
  final ICharacterRepository _characterRepository;

  GetCharacterBasicUseCase(this._characterRepository);

  @override
  Future<ResultRest<BasicInfo>> execute([BaseParams? params]) {
    final BaseParams input = params ?? BaseParams(date: DateTime.now());

    return _characterRepository.getCharacterBasic(ocid: input.ocid, date: input.date);
  }
}