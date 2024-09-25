import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/model/result.dart';
import 'package:maple_story_book/app/domain/entity/ability.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/character.dart';
import 'package:maple_story_book/core/util/use_case.dart';

@injectable
class GetAbilityUseCase
    implements IUseCase<ResultRest<Ability>, GetAbilityParams> {
  final ICharacterRepository _characterRepository;

  GetAbilityUseCase(this._characterRepository);

  @override
  Future<ResultRest<Ability>> execute([GetAbilityParams? params]) {
    final GetAbilityParams input = params ?? GetAbilityParams(date: DateTime.now());

    return _characterRepository.getCharacterAbility(ocid: input.ocid, date:input.date);

  }
}

class GetAbilityParams {
  final String ocid;
  final DateTime date;

  GetAbilityParams({this.ocid = '', required this.date});
}
