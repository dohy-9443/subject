import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/data/source/model/base_params.dart';
import 'package:maple_story_book/app/data/source/model/result.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/repository/maple_story/maple_story.dart';
import 'package:maple_story_book/core/util/use_case.dart';

///
/// @Project name    : maple_story_book
/// @Class           : get_user_artifact.
/// @Created by      : shinheetae.
/// Created On       : 2024. 9. 27..
/// Description      :
///

@lazySingleton
class GetUserArtifactUseCase implements IUseCase<ResultRest<UnionArtifact>, BaseParams>{
  final IUnionRepository _unionRepository;

  GetUserArtifactUseCase(this._unionRepository);

  @override
  Future<ResultRest<UnionArtifact>> execute([BaseParams? params]) {
    final BaseParams input = params ?? BaseParams(date: DateTime.now());

    return _unionRepository.getUserUnionArtifact(ocid: input.ocid, date: input.date);
  }
}