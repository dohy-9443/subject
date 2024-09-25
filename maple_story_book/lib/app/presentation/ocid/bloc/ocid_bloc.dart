import 'package:injectable/injectable.dart';
import 'package:maple_story_book/app/domain/entity/entity.dart';
import 'package:maple_story_book/app/domain/use_case/use_case.dart';
import 'package:maple_story_book/core/util/bloc/bloc.dart';

///
/// @Project name    : maple_story_book
/// @Class           : ocid_bloc.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 25..
/// Description      : 
///

@injectable
class OcidBloc extends IMSBloc<Ocid, GetOcidParams> {
  OcidBloc(GetOcidUseCase getOcidUseCase) : super((params) => getOcidUseCase.execute(params).then((result) {
    if (result.isSuccess()) return result.data!;
    else throw Exception(result.message);
  }));
}