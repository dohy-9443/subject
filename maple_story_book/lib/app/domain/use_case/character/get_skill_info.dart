import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_skill_info.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

@singleton
class GetSkillInfoUseCase implements IUseCase<ResultRest<SkillInfo>, SkillInfoParams> {
  final ICharacterRepository _characterRepository;

  GetSkillInfoUseCase(this._characterRepository);

  @override
  Future<ResultRest<SkillInfo>> execute([SkillInfoParams? params]) {
    final SkillInfoParams input = params ?? SkillInfoParams(date: DateTime.now());

    return _characterRepository.getCharacterSkillInfo(ocid: input.ocid, date: input.date, characterSkillGrade: input.characterSkillGrade);
  }
}

class SkillInfoParams {
  final String ocid;
  DateTime? date;
  final String characterSkillGrade;

  SkillInfoParams({this.ocid = '', this.date, this.characterSkillGrade = ''});
}