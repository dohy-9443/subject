import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_cube.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

class GetHistoryCubeUseCase implements IUseCase<ResultRest<CubeHistory>, PotentialParams> {
  final IPotentialRepository _potentialRepository;

  GetHistoryCubeUseCase(this._potentialRepository);

  @override
  Future<ResultRest<CubeHistory>> execute([PotentialParams? params]) {
    final PotentialParams input = params ?? PotentialParams(date: DateTime.now());

    return _potentialRepository.getHistoryCube(count: input.count, date: input.date, cursor: input.cursor);
  }
}