///
/// @Project name    : maple_story_book
/// @Class           : local_storage.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 3..
/// Description      : 
///

enum StorageCategory { searchHistory, favorites }

abstract class ILocalStorageRepository {
  // 저장
  Future<void> saveItem(StorageCategory category, Map<String, String> item);
  // 불러오기
  Future<List<Map<String, String>>> getItems(StorageCategory category);
  // 삭제
  Future<void> deleteItem(StorageCategory category, String nickname);
  // 초기화
  Future<void> clearItems(StorageCategory category);
}