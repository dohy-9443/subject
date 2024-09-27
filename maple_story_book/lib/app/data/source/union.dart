import 'package:injectable/injectable.dart';
import 'package:maple_story_book/tool/network/network.dart';

///
/// @Project name    : maple_story_book
/// @Class           : union.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 9. 27..
/// Description      : 
///

abstract class IGetUnionDataSource {
  Future<dynamic> getUserUnion({required String ocid, DateTime? date});
  Future<dynamic> getUserUnionRaider({required String ocid, DateTime? date});
  Future<dynamic> getUserUnionArtifact({required String ocid, DateTime? date});
}

@lazySingleton
class UnionDataSource implements IGetUnionDataSource {
  final GetMapleStoryBookUnionApi _api;

  UnionDataSource(this._api);

  @override
  Future getUserUnion({required String ocid, DateTime? date}) {
    return _api.getUserUnion(ocid: ocid, date: date);
  }

  @override
  Future getUserUnionArtifact({required String ocid, DateTime? date}) {
    return _api.getUserUnionArtifact(ocid: ocid, date: date);
  }

  @override
  Future getUserUnionRaider({required String ocid, DateTime? date}) {
    return _api.getUserUnionRaider(ocid: ocid, date: date);
  }

}