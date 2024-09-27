import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_item_equipment.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

class GetItemEquipmentUseCase implements IUseCase<ResultRest<ItemEquipment>, BaseParams> {
  final ICharacterRepository _characterRepository;

  GetItemEquipmentUseCase(this._characterRepository);

  @override
  Future<ResultRest<ItemEquipment>> execute([BaseParams? params]) {
    final BaseParams input = params ?? BaseParams(date: DateTime.now());

    return _characterRepository.getCharacterItemEquipment(ocid: input.ocid, date: input.date);
  }
}