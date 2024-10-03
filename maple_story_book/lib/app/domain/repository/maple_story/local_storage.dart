import 'package:maple_story_book/app/data/source/model/model.dart';

///
/// @Project name    : maple_story_book
/// @Class           : local_storage.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 3..
/// Description      : 
///

abstract class ILocalStorageRepository {
  // category에 맞게 저장
  Future<void> saveHistory(String category, List<LocalStorageModel> history);
  // category에 맞게 불러오기
  Future<List<LocalStorageModel>> getHistory(String category);
  // category에 저장된 모든 데이터 삭제
  Future<void> deleteHistory(String category);
  // category에 저장된 리스트에 추가 근데 있으면 제거하고 추가
  Future<void> addEntry(String category, LocalStorageModel entry);
  // category에 저장된 리스트에 일치하는 닉네임 삭제
  Future<void> removeEntry(String category, String nickName);
}