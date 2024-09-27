import 'package:maple_story_book/app/data/source/model/result.dart';
import 'package:maple_story_book/app/data/source/source.dart';
import 'package:maple_story_book/app/domain/entity/union_artifact.dart';
import 'package:maple_story_book/app/domain/entity/union_info.dart';
import 'package:maple_story_book/app/domain/entity/union_raider.dart';
import 'package:maple_story_book/app/domain/repository/repository.dart';
import 'package:maple_story_book/core/extension/base_response.dart';

///
/// @Project name    : maple_story_book
/// @Class           : union.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

class UnionRepository with BaseResponse implements IUnionRepository {
  final UnionDataSource _unionDataSource;

  UnionRepository(this._unionDataSource);

  @override
  Future<ResultRest<UnionInfo>> getUserUnion({required String ocid, DateTime? date}) {
    return handleApiResponse<UnionInfo>(
      request: () => _unionDataSource.getUserUnion(ocid: ocid, date: date),
      fromJson: (json) => UnionInfo.fromJson(json),
    );
  }

  @override
  Future<ResultRest<UnionArtifact>> getUserUnionArtifact({required String ocid, DateTime? date}) {
    return handleApiResponse<UnionArtifact>(
      request: () => _unionDataSource.getUserUnionArtifact(ocid: ocid, date: date),
      fromJson: (json) => UnionArtifact.fromJson(json),
    );
  }

  @override
  Future<ResultRest<UnionRaider>> getUserUnionRaider({required String ocid, DateTime? date}) {
    return handleApiResponse<UnionRaider>(
      request: () => _unionDataSource.getUserUnionRaider(ocid: ocid, date: date),
      fromJson: (json) => UnionRaider.fromJson(json),
    );
  }

}