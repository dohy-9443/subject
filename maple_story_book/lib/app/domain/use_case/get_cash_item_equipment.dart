import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_cash_item_equipment.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

class GetCashItemEquipmentUseCase implements IUseCase<ResultRest<CashItemEquipment>, BaseParams> {
  final ICharacterRepository _characterRepository;

  GetCashItemEquipmentUseCase(this._characterRepository);

  @override
  Future<ResultRest<CashItemEquipment>> execute([BaseParams? params]) {
    final BaseParams input = params ?? BaseParams(date: DateTime.now());

    return _characterRepository.getCharacterCashItemEquipment(ocid: input.ocid, date: input.date);
  }
}