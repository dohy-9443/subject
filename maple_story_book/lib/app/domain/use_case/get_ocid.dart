import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/use_case.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_ocid.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 25..
/// Description      : 
///

@injectable
class GetOcidUseCase implements IUseCase<ResultRest<Ocid>, GetOcidParams> {

  final ICharacterRepository _characterRepository;

  GetOcidUseCase(this._characterRepository);

  @override
  Future<ResultRest<Ocid>> execute([GetOcidParams? params]) {
    final GetOcidParams input = params ?? GetOcidParams();

    return _characterRepository.getOcid(characterName: input.characterName);
  }

}

class GetOcidParams {
  final String characterName;

  GetOcidParams({this.characterName = ''});
}