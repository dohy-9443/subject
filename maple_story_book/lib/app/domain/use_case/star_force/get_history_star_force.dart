import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/model/model.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/use_case.dart';

///
/// @Project name    : maple_story_book
/// @Class           : starforce.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 27..
/// Description      :
///

@injectable
class GetHistoryStarForce implements IUseCase<ResultRest<StarForceHistory>, PotentialParams> {
  final IStarForceRepository _starForceRepository;

  GetHistoryStarForce(this._starForceRepository);

  @override
  Future<ResultRest<StarForceHistory>> execute([PotentialParams? params]) {
    final PotentialParams input = params ?? PotentialParams(date: DateTime.now());

    return _starForceRepository.getHistoryStarForce(count: input.count, date: input.date, cursor: input.cursor);
  }
}