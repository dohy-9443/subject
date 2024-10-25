import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/model/result.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/ability.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/character.dart';
import 'package:maple_story_book/core/util/use_case.dart';

@singleton
class GetAbilityUseCase
    implements IUseCase<ResultRest<Ability>, BaseParams> {
  final ICharacterRepository _characterRepository;

  GetAbilityUseCase(this._characterRepository);

  @override
  Future<ResultRest<Ability>> execute([BaseParams? params]) {
    final BaseParams input = params ?? BaseParams(date: DateTime.now().subtract(const Duration(days: 2)));

    return _characterRepository.getCharacterAbility(ocid: input.ocid, date:input.date);

  }
}
