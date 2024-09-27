import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_hexa_matrix_info.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

class GetHexaMatrixInfoUseCase implements IUseCase<ResultRest<HexaMatrixInfo>, BaseParams> {
  final ICharacterRepository _characterRepository;

  GetHexaMatrixInfoUseCase(this._characterRepository);

  @override
  Future<ResultRest<HexaMatrixInfo>> execute([BaseParams? params]) {
    final BaseParams input = params ?? BaseParams(date: DateTime.now());

    return _characterRepository.getCharacterHexaMatrixInfo(ocid: input.ocid, date: input.date);
  }
}