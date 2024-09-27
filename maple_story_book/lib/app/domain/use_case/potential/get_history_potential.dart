import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/util.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_history_potential.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

class GetHistoryPotentialUseCase implements IUseCase<ResultRest<PotentialHistory>, PotentialParams> {
  final IPotentialRepository _potentialRepository;

  GetHistoryPotentialUseCase(this._potentialRepository);

  @override
  Future<ResultRest<PotentialHistory>> execute([PotentialParams? params]) {
    final PotentialParams input = params ?? PotentialParams(date: DateTime.now());

    return _potentialRepository.getHistoryPotential(count: input.count, date: input.date, cursor: input.cursor);
  }
}