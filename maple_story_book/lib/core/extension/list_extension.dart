///
/// @Project name    : maple_story_book
/// @Class           : list_extension.
/// @Created by      : baekdonghyun.
/// Created On       : 2024. 10. 6..
/// Description      : 
///

extension ListExtensions<T> on List<T> {
  // 리스트가 비어 있지 않은지 확인
  bool isNotEmptyList() {
    return this.isNotEmpty;
  }
}