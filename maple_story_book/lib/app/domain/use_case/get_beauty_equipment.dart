import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_beauty_equipment.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

class GetBeautyEquipmentUseCase implements IUseCase<ResultRest<BeautyEquipment>, BaseParams> {
  final ICharacterRepository _characterRepository;

  GetBeautyEquipmentUseCase(this._characterRepository);

  @override
  Future<ResultRest<BeautyEquipment>> execute([BaseParams? params]) {
    final BaseParams input = params ?? BaseParams(date: DateTime.now());

    return _characterRepository.getCharacterBeautyEquipment(ocid: input.ocid, date:input.date);
  }
}